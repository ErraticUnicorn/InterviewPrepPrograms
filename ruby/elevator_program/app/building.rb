class Building
  attr_reader :floors, :elevators

  BOTTOM_FLOOR = 0

  def initialize(floors, elevators)
    @floors = floors
    @elevators = elevators
    freeze
  end
end