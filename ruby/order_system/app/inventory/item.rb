class Item
  attr_reader :id

  def initialize(id)
    @id = id
    freeze
  end
end