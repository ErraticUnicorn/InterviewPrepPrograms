require "minitest/autorun"
require_relative "../app/template_app"

class TemplateAppTest < Minitest::Test
    def test_frequency_calculator
      
      text = "Hello world! This is a test. Hello again, world."

      expected_output = {
          "a" => 1,
          "again" => 1,
          "hello" => 2,
          "is" => 1,
          "test" => 1,
          "this" => 1,
          "world" => 2
      }

      result = word_frequency(text)
      assert_equal expected_output, result
    end
end