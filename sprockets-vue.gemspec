$:.unshift File.expand_path("../lib", __FILE__)
require 'sprockets/vue/version'

Gem::Specification.new do |s|
  s.name    = 'sprockets-vue'
  s.version = Sprockets::Vue::VERSION

  s.homepage    = "https://github.com/TannerRogalsky/sprockets-es6"
  s.summary     = "Sprockets Vue transformer"
  s.description = <<-EOS
                A Sprockets transformer that converts .vue file into js object.
  EOS
  s.license = "MIT"

  s.files = [
    'lib/sprockets/vue.rb',
    'lib/sprockets/vue/version.rb',
    'LICENSE',
    'README.md'
  ]

  s.add_dependency 'sprockets', '>= 3.0.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'

  s.authors = ['kikyous']
  s.email   = 'kikyous@163.com'
end
