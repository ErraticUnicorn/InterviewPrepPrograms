require "minitest/autorun"
require_relative "../app/elevator"
require_relative "../app/elevator_directions"
require_relative "../app/elevator_request"

class ElevatorMovementTest < Minitest::Test
    def test_move_up
      elevator = Elevator.new(1, ElevatorDirections::IDLE, [], 10)
      elevator = ElevatorMovement.move_up(elevator)
      assert_equal 2, elevator.current_floor
    end

    def test_move_down
      elevator = Elevator.new(1, ElevatorDirections::IDLE, [], 10)
      elevator = ElevatorMovement.move_down(elevator)
      assert_equal 0, elevator.current_floor
    end

    def test_move_up_max_floor
      elevator = Elevator.new(10, ElevatorDirections::IDLE, [], 10)
      elevator = ElevatorMovement.move_up(elevator)
      assert_equal 10, elevator.current_floor
    end

    def test_move_down_bottom_floor
      elevator = Elevator.new(0, ElevatorDirections::IDLE, [], 10)
      elevator = ElevatorMovement.move_down(elevator)
      assert_equal 0, elevator.current_floor
    end

    def test_right_order_of_requests
      request = ElevatorRequest.new(ElevatorRequestType::OUTSIDE, 5, ElevatorDirections::UP)
      request_2 = ElevatorRequest.new(ElevatorRequestType::INSIDE, 3, nil)
      request_3 = ElevatorRequest.new(ElevatorRequestType::INSIDE, 8, nil)
      elevator = Elevator.new(0, ElevatorDirections::IDLE, [request, request_2, request_3], 10)
      assert_equal [request_2, request_3, request], elevator.requests
    end
end