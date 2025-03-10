class Box
  attr_reader :box_type, :contents
  def initialize(box_size, contents)
    @box_type = box_size
    @contents = contents
    freeze
  end
end

module BoxSize
  LARGE = :large
  MEDIUM = :medium
  SIZES = [LARGE, MEDIUM].freeze 
end