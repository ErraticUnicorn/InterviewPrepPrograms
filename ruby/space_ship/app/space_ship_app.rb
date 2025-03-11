
# Scenario:
# TODO:
=begin
Here’s some more info about the project.

    The ship’s starting coordinates are (0, 0), which is on Earth.
    The ship’s destination is (0, 250), which is on the moon.

The ship will be controlled over a CLI using a standard keyboard as follows:

    The ship starts at (0, 0) at 0 speed, i.e. at complete rest.
    The ship only moves when a valid key is pressed.
    Pressing W increases the ship’s speed and then moves it forward by speed units.
        The ship’s maximum speed is 5.
    Pressing S decreases the ship’s speed and then moves it forward by speed units.
        The ship’s minimum speed is 0.
        After launch, the ship cannot go below speed 1, i.e. it always moves forward until it reaches the moon.
    Pressing A and D move the ship left and right by one unit respectively.
        The ship also moves forward by speed units.

Problem

Write a CLI program in your preferred language to simulate the above spacecraft. Display output as follows:

    Begin with (0, 0) ready for launch.
    After every movement, display the updated position.
    If the ship goes more than 5 points to the left/right, display wrong trajectory.
    If the ship tries to decrease the speed below 1, display minimum speed.
    If the ship tries to increase the speed over 5, display maximum speed.
    When the ship reaches (0, 250) display on the moon.
    If the ship goes beyond 250 on the y-axis, display contact lost.
=end

require_relative "space_ship"

space_ship = SpaceShip.new(0, 0, 0, 250, 0)
puts "Begin with (0, 0) ready for launch."

loop do
    puts "Valid commands are W, S, A, D"
    command = gets.chomp.upcase
    case command
        when "W"
            space_ship = SpaceShipMovement.move_up(space_ship)
        when "S"
            space_ship = SpaceShipMovement.move_down(space_ship)
        when "A"
            space_ship = SpaceShipMovement.move_left(space_ship)
        when "D"
            space_ship = SpaceShipMovement.move_right(space_ship)
        else
            puts "Invalid command"
    end

    puts "New position: (#{space_ship.pos_x}, #{space_ship.pos_y}), destination is at (#{space_ship.destination_x}, #{space_ship.destination_y})"
    if space_ship.at_destination?
        puts "On the moon"
        break
    elsif space_ship.contact_lost?
        puts "Contact lost"
        break
    end
end
