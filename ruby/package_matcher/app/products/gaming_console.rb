class GamingConsole
  include Product
  attr_reader :identifier, :sizes

  def initialize()
    @identifier = Product::GAMING_CONSOLE
    @sizes = [ProductSize.new(BoxSize::LARGE, 2)]
    freeze
  end

  def identifier_to_string()
    return "Game"
  end
end