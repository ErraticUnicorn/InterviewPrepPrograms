module Cardinality
  NORTH = :N
  EAST  = :E
  SOUTH = :S
  WEST  = :W

  CARDINAL_DIRECTIONS = [NORTH, EAST, SOUTH, WEST].freeze

  def self.left_of(direction)
    index = CARDINAL_DIRECTIONS.index(direction)
    CARDINAL_DIRECTIONS[(index - 1) % 4]
  end

  def self.right_of(direction)
    index = CARDINAL_DIRECTIONS.index(direction)
    CARDINAL_DIRECTIONS[(index + 1) % 4]
  end
end