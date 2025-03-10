require "minitest/autorun"
require_relative "../app/products/product"
require_relative "../app/box/box"
require_relative "../app/products/product_size"
require_relative "../app/products/camera"
require_relative "../app/products/gaming_console"
require_relative "../app/products/bluetooth_speaker"
require_relative "../app/products/product_matcher"

class ProductMatcherTest < Minitest::Test
    def test_bluetooth_speaker_matching
      products = ["Blue"]
      boxes = ProductMatcher.match(products)
      expected = [
        {box_type: BoxSize::LARGE, contents: ["Blue"]} 
      ]
      actual = boxes.map { |box| {box_type: box.box_type, contents: box.contents} }
      assert_equal expected, actual

      products = ["Blue", "Blue", "Blue"]
      boxes = ProductMatcher.match(products)
      expected = [
        {box_type: BoxSize::LARGE, contents: ["Blue"]},
        {box_type: BoxSize::LARGE, contents: ["Blue"]},
        {box_type: BoxSize::LARGE, contents: ["Blue"]}
      ]
      actual = boxes.map { |box| {box_type: box.box_type, contents: box.contents} }
      assert_equal expected, actual
    end

    def test_gaming_console_matching
      products = ["Game"]
      boxes = ProductMatcher.match(products)
      expected = [
        {box_type: BoxSize::LARGE, contents: ["Game"]}
      ]
      actual = boxes.map { |box| {box_type: box.box_type, contents: box.contents} }
      assert_equal expected, actual

      products = ["Game", "Game", "Game"]
      boxes = ProductMatcher.match(products)
      expected = [
        {box_type: BoxSize::LARGE, contents: ["Game", "Game"]},
        {box_type: BoxSize::LARGE, contents: ["Game"]}
      ]
      actual = boxes.map { |box| {box_type: box.box_type, contents: box.contents} }
      assert_equal expected, actual
    end

    def test_camera
      products = ["Cam"]
      boxes = ProductMatcher.match(products)
      expected = [
        {box_type: BoxSize::MEDIUM, contents: ["Cam"]}
      ]
      actual = boxes.map { |box| {box_type: box.box_type, contents: box.contents} }
      assert_equal expected, actual

      products = ["Cam", "Cam", "Cam", "Cam", "Cam"]
      boxes = ProductMatcher.match(products)
      expected = [
        {box_type: BoxSize::LARGE, contents: ["Cam", "Cam"]},
        {box_type: BoxSize::LARGE, contents: ["Cam", "Cam"]},
        {box_type: BoxSize::MEDIUM, contents: ["Cam"]}
      ]
      actual = boxes.map { |box| {box_type: box.box_type, contents: box.contents} }
      assert_equal expected, actual
    end

    def test_multiple_products
      # Test this input["Cam", "Cam", "Cam", "Game", "Game", "Cam", "Cam", "Blue", "Blue"] -> [L: ["Cam", "Cam"] , L: ["Cam", "Cam"] , M: ["Cam"] , L: ["Game", "Game"] , L: ["Blue"] , L: ["Blue"]]
      produts = ["Cam", "Cam", "Cam", "Game", "Game", "Cam", "Cam", "Blue", "Blue"]
      boxes = ProductMatcher.match(produts)
    
      expected = [
        {box_type: BoxSize::LARGE, contents: ["Cam", "Cam"]},
        {box_type: BoxSize::LARGE, contents: ["Cam", "Cam"]},
        {box_type: BoxSize::MEDIUM, contents: ["Cam"]},
        {box_type: BoxSize::LARGE, contents: ["Game", "Game"]},
        {box_type: BoxSize::LARGE, contents: ["Blue"]},
        {box_type: BoxSize::LARGE, contents: ["Blue"]}
      ]
      actual = boxes.map { |box| {box_type: box.box_type, contents: box.contents} }
      assert_equal expected, actual
    end
end