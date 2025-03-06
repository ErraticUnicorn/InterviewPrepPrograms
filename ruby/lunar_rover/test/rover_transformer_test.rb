require "minitest/autorun"
require_relative "../app/rover"
require_relative "../app/cardinality"

class RoverTransformerTest  < Minitest::Test
  def test_move_north
    rover = Rover.new(0, 0, Cardinality::NORTH)
    rover = RoverTransformer.move(rover)
    position = [rover.x, rover.y]
    assert_equal [0, 1], position
  end

  def test_move_south
    rover = Rover.new(0, 0, Cardinality::SOUTH)
    rover = RoverTransformer.move(rover)
    position = [rover.x, rover.y]
    assert_equal [0, -1], position
  end

  def test_move_east
    rover = Rover.new(0, 0, Cardinality::EAST)
    rover = RoverTransformer.move(rover)
    position = [rover.x, rover.y]
    assert_equal [1, 0], position
  end

  def test_move_west
    rover = Rover.new(0, 0, Cardinality::WEST)
    rover = RoverTransformer.move(rover)
    position = [rover.x, rover.y]
    assert_equal [-1, 0], position
  end
end