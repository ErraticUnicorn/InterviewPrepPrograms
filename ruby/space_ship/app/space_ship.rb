class SpaceShip
  # Could add a state machine in order to manage space ship state i.e. Grounded, Enroute, On Moon, Contact Lost
  attr_reader :pos_x, :pos_y, :destination_x, :destination_y, :speed

  MAX_SPEED = 5
  MIN_SPEED = 1
  VELOCITY = 1

  def initialize(pos_x, pos_y, destination_x, destination_y, speed)
    @pos_x = pos_x
    @pos_y = pos_y
    @destination_x = destination_x
    @destination_y = destination_y
    @speed = speed
    freeze
  end

  def at_destination?
    return pos_x == destination_x && pos_y == destination_y
  end

  def contact_lost?
    return pos_y > destination_y
  end
end

module SpaceShipMovement
  def self.move_right(ship)
    return SpaceShip.new(ship.pos_x + SpaceShip::VELOCITY, ship.pos_y + ship.speed, ship.destination_x, ship.destination_y, ship.speed)
  end

  def self.move_left(ship)
    return SpaceShip.new(ship.pos_x - SpaceShip::VELOCITY, ship.pos_y + ship.speed, ship.destination_x, ship.destination_y, ship.speed)
  end

  def self.move_up(ship)
    if ship.speed >= 5
      puts "Max speed reached"
      return SpaceShip.new(ship.pos_x, ship.pos_y + ship.speed, ship.destination_x, ship.destination_y, ship.speed)
    else
      new_speed = ship.speed + SpaceShip::VELOCITY
      return SpaceShip.new(ship.pos_x, ship.pos_y + new_speed, ship.destination_x, ship.destination_y, new_speed)
    end
  end

  def self.move_down(ship)
    if ship.speed <= 1
      puts "Minimum speed reached"
      return SpaceShip.new(ship.pos_x, ship.pos_y, ship.destination_x, ship.destination_y, ship.speed)
    else
      new_speed = ship.speed - SpaceShip::VELOCITY
      return SpaceShip.new(ship.pos_x, ship.pos_y + new_speed, ship.destination_x, ship.destination_y, new_speed)
    end
  end
end