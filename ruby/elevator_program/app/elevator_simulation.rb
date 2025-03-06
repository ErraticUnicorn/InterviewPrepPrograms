require_relative "building"
require_relative "elevator_request" 
require_relative "elevator"
require_relative "elevator_directions"

module ElevatorSimulation
  def self.run_simulation(building, max_steps = 100)
    current_building = building
    step = 0
    
    # TODO: make this support multiple elevators
    elevator = current_building.elevators.first
    
    while !elevator.requests.empty? && step < max_steps
      step += 1
      puts "===== Step #{step} ====="
      
      if !elevator.requests.empty? && ElevatorMovement.elevator_at_requested_floor(elevator)
        puts "Elevator stopped at floor #{elevator.current_floor}"
        elevator = ElevatorMovement.process_floor_stop(elevator)
      end
      
      if !elevator.requests.empty?
        elevator = ElevatorMovement.determine_next_direction(elevator)
        elevator = ElevatorMovement.move_elevator(elevator)
      end
      

      puts "Elevator at Floor #{elevator.current_floor}, Direction: #{elevator.direction}"
      puts "Remaining requests: #{elevator.requests.length}"
      
      current_building = Building.new(current_building.floors, [elevator])
      
      # Short delay for visibility
      sleep(0.5)
    end
    
    puts "===== Simulation Complete ====="
    puts elevator.requests.empty? ? "All requests processed!" : "Max steps reached."
    
    return current_building
  end
end