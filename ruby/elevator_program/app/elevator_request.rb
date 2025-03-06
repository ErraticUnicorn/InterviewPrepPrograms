class ElevatorRequest
  attr_reader :type_of_request, :floor, :direction

  def initialize(type_of_request, floor, direction)
    @type_of_request = type_of_request
    @floor = floor
    @direction = direction
    freeze
  end

  def self.sort_requests(requests)
    requests.sort_by do |request|
      type_priority = request.type_of_request == ElevatorRequestType::INSIDE ? 0 : 1
      [type_priority, request.floor]
    end
  end
end

module ElevatorRequestType
  INSIDE = :inside
  OUTSIDE = :outside
end