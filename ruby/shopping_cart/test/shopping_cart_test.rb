require "minitest/autorun"
require_relative "../app/shopping_cart"
require_relative "../app/product"

class ShoppingCartTest < Minitest::Test
    def test_add_item
      shopping_cart = ShoppingCart.new([])
      product = Product.new(1, "T-shirt", 20.00, "Clothing", 0.2)
      shopping_cart = ShoppingCart.add_item(shopping_cart, product)
      assert_equal 1, shopping_cart.items.length
      assert_equal product, shopping_cart.items.first
    end

    def test_calculate_price
      product_1 = Product.new(1, "T-shirt", 20.00, "Clothing", 0.2)
      product_2 = Product.new(2, "Jeans", 50.00, "Clothing", 0.8)
      product_3 = Product.new(3, "Socks", 5.00, "Clothing", 0.1)
      shopping_cart = ShoppingCart.new([product_1, product_2, product_3])
      assert_equal 75.00, ShoppingCart.calculate_price(shopping_cart)
    end
end