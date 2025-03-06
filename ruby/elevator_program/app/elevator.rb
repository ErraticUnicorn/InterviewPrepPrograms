class Elevator
  attr_reader :current_floor, :direction, :requests, :floors

  def initialize(current_floor, direction, requests, floors)
    @current_floor = current_floor
    sorted_requests = ElevatorRequest.sort_requests(requests)
    @direction = direction
    @requests = sorted_requests
    @floors = floors
    freeze
  end

  def self.add_request(elevator, request)
    new_requests = elevator.requests + [request]
    sorted_requests = ElevatorRequest.sort_requests(new_requests)
    return Elevator.new(elevator.current_floor, elevator.direction, sorted_requests, elevator.floors)
  end

  def self.remove_request(elevator)
    new_requests = elevator.requests.drop(1)
    return Elevator.new(elevator.current_floor, elevator.direction, new_requests, elevator.floors)
  end
end


module ElevatorMovement
  def self.move_up(elevator)
    if elevator.current_floor < elevator.floors
      return Elevator.new(elevator.current_floor + 1, ElevatorDirections::UP, elevator.requests, elevator.floors)
    else
      return elevator
    end
  end
 
  def self.move_down(elevator)
    if elevator.current_floor > 0
      return Elevator.new(elevator.current_floor - 1, ElevatorDirections::DOWN, elevator.requests, elevator.floors)
    else
      return elevator
    end
  end

  def self.move_elevator(elevator)
    if elevator.direction == ElevatorDirections::UP
      return move_up(elevator)
    elsif elevator.direction == ElevatorDirections::DOWN
      return move_down(elevator)
    else
      return elevator
    end
  end

  def self.elevator_at_requested_floor(elevator)
    if elevator.current_floor == elevator.requests.first.floor
      return true
    else
      return false
    end
  end

  def self.determine_next_direction(elevator)
    if elevator.requests.empty?
      return Elevator.new(elevator.current_floor, ElevatorDirections::IDLE, elevator.requests, elevator.floors)
    else
      next_request = elevator.requests.first
      if next_request.floor > elevator.current_floor
        return Elevator.new(elevator.current_floor, ElevatorDirections::UP, elevator.requests, elevator.floors)
      elsif next_request.floor < elevator.current_floor
        return Elevator.new(elevator.current_floor, ElevatorDirections::DOWN, elevator.requests, elevator.floors) 
      else
        return Elevator.new(elevator.current_floor, ElevatorDirections::IDLE, elevator.requests, elevator.floors)
      end
    end
  end

  def self.process_floor_stop(elevator)
    return Elevator.remove_request(elevator)
  end
end