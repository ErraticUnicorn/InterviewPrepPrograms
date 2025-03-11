require "minitest/autorun"
require_relative "../app/space_ship"

class SpaceShipTest < Minitest::Test
    def test_space_ship_move_left
      ship = SpaceShip.new(0, 0, 0, 250, 1)
      new_ship = SpaceShipMovement.move_left(ship)
      assert_equal new_ship.pos_x, -1
      assert_equal new_ship.pos_y, 1
    end

    def test_space_ship_move_right
      ship = SpaceShip.new(0, 0, 0, 250, 1)
      new_ship = SpaceShipMovement.move_right(ship)
      assert_equal new_ship.pos_x, 1
      assert_equal new_ship.pos_y, 1
    end

    def test_move_up
      ship = SpaceShip.new(0, 0, 0, 250, 1)
      new_ship = SpaceShipMovement.move_up(ship)
      assert_equal new_ship.pos_x, 0
      assert_equal new_ship.pos_y, 2

      ship = SpaceShip.new(0, 0, 0, 250, 5)
      new_ship = SpaceShipMovement.move_up(ship)
      assert_equal new_ship.pos_x, 0
      assert_equal new_ship.pos_y, 5
    end

    def test_move_down
      ship = SpaceShip.new(0, 0, 0, 250, 1)
      new_ship = SpaceShipMovement.move_down(ship)
      assert_equal new_ship.pos_x, 0
      assert_equal new_ship.pos_y, 0

      ship = SpaceShip.new(0, 5, 0, 250, 5)
      new_ship = SpaceShipMovement.move_down(ship)
      assert_equal new_ship.pos_x, 0
      assert_equal new_ship.pos_y, 9
    end
end