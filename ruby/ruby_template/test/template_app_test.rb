require "minitest/autorun"
require_relative "../app/template_app"

class TemplateAppTest < Minitest::Test
    def test_hello_world
      assert_equal "Hello World", hello_world
    end
end