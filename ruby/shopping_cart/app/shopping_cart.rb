class ShoppingCart
  attr_reader :items

  def initialize(items)
    @items = items
    freeze
  end

  def self.add_item(shopping_cart, product)
    new_items = shopping_cart.items + [product]
    return ShoppingCart.new(new_items)
  end

  def self.calculate_price(shopping_cart)
    return shopping_cart.items.map(&:price).sum
  end
end