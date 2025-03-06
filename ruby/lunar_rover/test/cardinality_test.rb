require "minitest/autorun"
require_relative "../app/cardinality"

class CardinalityTest < Minitest::Test

    def test_right_of
      north = Cardinality.right_of(Cardinality::WEST)
      assert_equal Cardinality::NORTH, north

      west = Cardinality.right_of(Cardinality::SOUTH)
      assert_equal Cardinality::WEST, west

      south = Cardinality.right_of(Cardinality::EAST)
      assert_equal Cardinality::SOUTH, south

      east = Cardinality.right_of(Cardinality::NORTH)
      assert_equal Cardinality::EAST, east
    end

    def test_left_of
      west = Cardinality.left_of(Cardinality::NORTH)
      assert_equal Cardinality::WEST, west

      south = Cardinality.left_of(Cardinality::WEST)
      assert_equal Cardinality::SOUTH, south

      east = Cardinality.left_of(Cardinality::SOUTH)
      assert_equal Cardinality::EAST, east
      
      north = Cardinality.left_of(Cardinality::EAST)
      assert_equal Cardinality::NORTH, north
    end

    def test_rotate_left
      west = Cardinality.rotate_left(Cardinality::NORTH)
      assert_equal Cardinality::WEST, west

      south = Cardinality.rotate_left(Cardinality::WEST)
      assert_equal Cardinality::SOUTH, south

      east = Cardinality.rotate_left(Cardinality::SOUTH)
      assert_equal Cardinality::EAST, east
      
      north = Cardinality.rotate_left(Cardinality::EAST)
      assert_equal Cardinality::NORTH, north
    end

    def test_rotate_right
      west = Cardinality.rotate_right(Cardinality::NORTH)
      assert_equal Cardinality::WEST, west

      south = Cardinality.rotate_right(Cardinality::WEST)
      assert_equal Cardinality::SOUTH, south

      east = Cardinality.rotate_right(Cardinality::SOUTH)
      assert_equal Cardinality::EAST, east
      
      north = Cardinality.rotate_right(Cardinality::EAST)
      assert_equal Cardinality::NORTH, north
    end
  end