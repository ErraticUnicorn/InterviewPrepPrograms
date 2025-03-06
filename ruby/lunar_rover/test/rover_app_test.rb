require "minitest/autorun"
require_relative "../app/rover_app"

class RoverAppTest < Minitest::Test
    def test_hello_world
      assert_equal "Hello World", hello_world
    end
  end