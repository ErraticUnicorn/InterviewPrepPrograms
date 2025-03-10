class ProductSize
  attr_reader :box_type, :quantity

  def initialize(box_type, quantity)
    @box_type = box_type
    @quantity = quantity
    freeze
  end
end