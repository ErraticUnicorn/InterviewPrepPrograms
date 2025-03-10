require_relative "../box/box"
require_relative "../products/product_size"

module Product
  CAMERA = :CAM
  GAMING_CONSOLE = :GAME
  BLUETOOTH_SPEAKER = :BLUE
  PRODUCTS = [CAMERA, GAMING_CONSOLE, BLUETOOTH_SPEAKER].freeze

  def identifier_to_string()
    raise "Not implemented"
  end
end
