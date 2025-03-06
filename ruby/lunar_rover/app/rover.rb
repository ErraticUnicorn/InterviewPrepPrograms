class Rover
  attr_reader :x, :y, :cardinal_direction

  def initialize(x, y, cardinal_direction)
    @x = x
    @y = y
    @cardinal_direction = cardinal_direction
    freeze
  end
end

module RoverTransformer

  def self.move(rover)
    new_x = rover.x
    new_y = rover.y
    case rover.cardinal_direction
    when Cardinality::NORTH
      new_y = rover.y + 1
    when Cardinality::EAST
      new_x = rover.x + 1
    when Cardinality::SOUTH
      new_y = rover.y - 1
    when Cardinality::WEST
      new_x = rover.x - 1
    end

    return Rover.new(new_x, new_y, rover.cardinal_direction)
  end

  def self.rotate_right(rover)
    new_direction = case rover.cardinal_direction
                    when Cardinality::NORTH
                      Cardinality.right_of(rover.cardinal_direction)
                    when Cardinality::EAST
                      Cardinality.right_of(rover.cardinal_direction)
                    when Cardinality::SOUTH
                      Cardinality.right_of(rover.cardinal_direction)
                    when Cardinality::WEST
                      Cardinality.right_of(rover.cardinal_direction)
                    end

    
    return Rover.new(rover.x, rover.y, new_direction)
  end

  def self.rotate_left(rover)
    new_direction = case rover.cardinal_direction
                    when Cardinality::NORTH
                      Cardinality.left_of(rover.cardinal_direction)
                    when Cardinality::EAST
                      Cardinality.left_of(rover.cardinal_direction)
                    when Cardinality::SOUTH
                      Cardinality.left_of(rover.cardinal_direction)
                    when Cardinality::WEST
                      Cardinality.left_of(rover.cardinal_direction)
                    end


    return Rover.new(rover.x, rover.y, new_direction)
  end
end