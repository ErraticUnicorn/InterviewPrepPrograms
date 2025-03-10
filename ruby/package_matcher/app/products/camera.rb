class Camera
  include Product
  attr_reader :identifier, :sizes

  def initialize()
    @identifier = Product::CAMERA
    @sizes = [ProductSize.new(BoxSize::LARGE, 2), ProductSize.new(BoxSize::MEDIUM, 1)]
    freeze
  end

  def identifier_to_string()
    return "Cam"
  end
end