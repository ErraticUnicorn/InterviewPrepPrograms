class Product
  attr_reader :id, :name, :price, :category, :weight

  def initialize(id, name, price, category, weight)
    @id = id
    @name = name
    @price = price
    @category = category
    @weight = weight
    freeze
  end
end