require 'sprockets'
require 'sprockets/vue/version'
require 'sprockets/vue/script'
require 'sprockets/vue/style'

module Sprockets
  if respond_to?(:register_transformer)
    register_mime_type 'text/vue', extensions: ['.vue'], charset: :unicode
    register_transformer 'text/vue', 'application/javascript', Vue::Script
    register_processor 'text/vue', Sprockets::DirectiveProcessor

    register_transformer 'text/vue', 'text/css', Vue::Style
  end
end
