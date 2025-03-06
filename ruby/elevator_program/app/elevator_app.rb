require_relative "building"
require_relative "elevator_simulation"
# Scenario:
# Problem: Elevator System Simulation

# You need to design a simple elevator system that operates in a multi-floor building. The elevator must handle requests to move up or down while following a set of rules.
# Requirements:
#     The elevator operates in a building with N floors (e.g., 10 floors).
#     The elevator can receive requests from inside (passengers pressing buttons) and outside (people calling from a floor).
#     It moves one floor at a time towards its destination.
#     If it reaches a requested floor, it stops for a brief moment before continuing.
#     Requests are processed in a fair manner:
#         If moving up, it handles all requests above first before switching to downward movement.
#         If moving down, it handles all requests below first before switching to upward movement.

# Additional Constraints for Complexity:

#     Design it functionally, where the elevator state is immutable (i.e., returns a new elevator state instead of modifying the existing one).
#     Support multiple elevators in a single system.
#     Simulate concurrent requests where multiple people request an elevator simultaneously.

def sample_function()
    return "Hello World"
end

puts "Greetings, User! Welcome to the building. First, how high is the building?"

building_floors = gets.chomp.to_i
elevator = Elevator.new(0, ElevatorDirections::IDLE, [], building_floors)
elevator = Elevator.add_request(elevator, ElevatorRequest.new(ElevatorRequestType::OUTSIDE, 5, ElevatorDirections::UP))
elevator = Elevator.add_request(elevator, ElevatorRequest.new(ElevatorRequestType::INSIDE, 3, nil))

building = Building.new(building_floors, [elevator])

puts "Your building has #{building.floors} floors and currently has one elevator"

building = ElevatorSimulation.run_simulation(building, 20)

puts "Simulation complete!"

