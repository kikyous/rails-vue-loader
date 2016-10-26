class Sprockets::Vue::Script
  class << self
    include ActionView::Helpers::JavaScriptHelper
    SCRIPT_REGEX = /\<script *(lang="(\w+)")?\>([\s\S]+)\<\/script\>/
    TEMPLATE_REGEX = /\<template\>([\s\S]+)\<\/template\>/
    SCRIPT_COMPILES = {
      'coffee' => ->(s, input){
        CoffeeScript.compile(s, sourceMap: true, sourceFiles: [input[:source_path]], no_wrap: true)
      },
      'es6' => ->(s, input){
        Babel::Transpiler.transform(data, {}) #TODO
      }
    }
    def call(input)
      data = input[:data]
      name = input[:name]
      input[:cache].fetch([cache_key, input[:source_path], data]) do
        script = SCRIPT_REGEX.match(data)
        template = TEMPLATE_REGEX.match(data)
        output = ''
        if script
          lang = script[2]
          result = SCRIPT_COMPILES[lang].call(script[3], input)

          output = ";if(typeof(VCompents)=='undefined')VCompents = {};
          VCompents['#{name}'] = #{result['js']};"
        end

        output << "VCompents['#{name.sub(/\.tpl$/, "")}'].template = '#{j template[1]}';" if template

        { data: output }
      end
    end

    def cache_key
      [
        self.name,
        ::Sprockets::Vue::VERSION,
      ].freeze
    end
  end
end
