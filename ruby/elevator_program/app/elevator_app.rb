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


=begin
TODO:
Add an integration tests to the elevator by simulating the loop via a test. The test would function similarly to our simulation function except we would manually iterate through the loop to assert elevator states.

Next, I would implement a solution with multiple elevators, this requires modifying the simulation to iterate through all teh buildings elevators and also adding logic to the building as the entrypoint for ElevatorRequests, i.e. we would separate the elevator request command further since outside commands go through the building while inside commands come from a specific elevator.

This would require logic to determine the nearest idle elevator, if there are no idle elevators some algorithm to determine which elevator would most likely finish first. Since the building is the entrypoint of commands and our commands are in a list and act as a queue, operating on the first one, I do not foresee any concurrency concerns especially since everything is functional.

Finally, for performance we could consider switching our list of commands into a priority queue.
=end

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

