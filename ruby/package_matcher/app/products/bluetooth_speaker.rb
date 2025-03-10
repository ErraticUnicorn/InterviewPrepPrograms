class Bluetooth
  include Product
  attr_reader :identifier, :sizes

  def initialize()
    @identifier = Product::BLUETOOTH_SPEAKER
    @sizes = [ProductSize.new(BoxSize::LARGE, 1)]
    freeze
  end

  def identifier_to_string()
    return "Blue"
  end
end