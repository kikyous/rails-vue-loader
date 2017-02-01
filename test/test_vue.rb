require 'minitest/autorun'
require 'sprockets'
require 'sprockets/vue'
require 'execjs'
require "coffee-script"
require 'sass'
require 'pry'

class TestVue < MiniTest::Test
  def setup
    @env = Sprockets::Environment.new
    @env.append_path File.expand_path("../fixtures", __FILE__)
  end

  def test_directive
    assert asset = @env["index"]
    assert asset.metadata[:required].length, 1
  end

  def test_mimetype
    assert asset = @env["index"]
    assert_equal 'text/vue', asset.content_type
  end

  def test_script_transformer
    asset = @env['index.js'].to_s
    context = ExecJS.compile(asset)

    assert_equal context.eval("VComponents.index.data().search"), 'test'
    components = context.eval("VComponents", bare: true)
    assert_equal components.keys, ["components/card", "index"]
    assert components['index']['template'].match(/clear-icon glyphicon glyphicon-remove/)
    assert components['components/card']['template'].match(/@click='expand=!expand'/)
  end

  def test_style_transformer
    asset = @env['index.css'].to_s
    assert asset.match(/.search .icon-input/)
    assert asset.match(/.avatar/)
  end
end
