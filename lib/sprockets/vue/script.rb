class Sprockets::Vue::Script
  class << self
    include ActionView::Helpers::JavaScriptHelper
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
        script_r = /\<script *(lang="(\w+)")?\>([\s\S]+)\<\/script\>/
        template_r = /\<template\>([\s\S]+)\<\/template\>/
        script = script_r.match(data)
        lang = script[2]
        template = template_r.match(data)

        result = SCRIPT_COMPILES[lang].call(script[3], input)

        output = ";if (typeof(VCompents)==='undefined')VCompents = {};
            VCompents['#{name}'] = #{result['js']};"
        output << "VCompents['#{name}'].template = '#{escape_javascript template[1]}';" if template

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
