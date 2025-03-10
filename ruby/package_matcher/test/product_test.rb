require "minitest/autorun"
require_relative "../app/products/product"
require_relative "../app/box/box"
require_relative "../app/products/product_size"
require_relative "../app/products/camera"
require_relative "../app/products/gaming_console"
require_relative "../app/products/bluetooth_speaker"

class ProductTest < Minitest::Test
    def test_camera
      camera = Camera.new()
      expected = [
        {box_type: BoxSize::MEDIUM, quantity: 1},
        {box_type: BoxSize::LARGE, quantity: 2}
      ]
      assert_equal "Cam", camera.identifier_to_string
      actual = camera.sizes.map { |size| {box_type: size.box_type, quantity: size.quantity} }
      assert_equal expected, actual
    end

    def test_gaming_console
      gaming_console = GamingConsole.new()
      expected = [
        {box_type: BoxSize::LARGE, quantity: 2}
      ]
      assert_equal "Game", gaming_console.identifier_to_string
      actual = gaming_console.sizes.map { |size| {box_type: size.box_type, quantity: size.quantity} }
      assert_equal expected, actual
    end

    def test_bluetooth_speaker
      bluetooth_speaker = Bluetooth.new()
      expected = [
        {box_type: BoxSize::LARGE, quantity: 1}
      ]
      assert_equal "Blue", bluetooth_speaker.identifier_to_string
      actual = bluetooth_speaker.sizes.map { |size| {box_type: size.box_type, quantity: size.quantity} }
      assert_equal expected, actual
    end
end