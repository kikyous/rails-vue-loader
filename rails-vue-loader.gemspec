$:.unshift File.expand_path("../lib", __FILE__)
require 'sprockets/vue/version'

Gem::Specification.new do |s|
  s.name    = 'rails-vue-loader'
  s.version = Sprockets::Vue::VERSION

  s.homepage    = "https://github.com/kikyous/rails-vue-loader"
  s.summary     = "Sprockets Vue transformer"
  s.description = <<-EOS
                A Sprockets transformer that converts .vue file into js object.
  EOS
  s.license = "MIT"

  s.files = Dir["README.md", "MIT-LICENSE", "lib/**/*.rb"]

  s.add_dependency 'sprockets', '>= 3.0.0'
  s.add_dependency 'actionview'
  s.add_dependency 'activesupport'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'execjs'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'sass'
  s.add_development_dependency 'coffee-script'

  s.authors = ['kikyous']
  s.email   = 'kikyous@163.com'
end
