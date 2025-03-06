require "minitest/autorun"
require_relative "../app/shopping_cart"
require_relative "../app/product"
require_relative "../app/discounts/QuantityDiscount"
require_relative "../app/discounts/CategoryDiscount"
require_relative "../app/DiscountCalculator"

class ShoppingCartTest < Minitest::Test
    def test_calculate_discount
      product_1 = Product.new(1, "T-shirt", 20.00, "Clothing", 0.2)
      product_2 = Product.new(2, "Jeans", 50.00, "Clothing", 0.8)
      product_3 = Product.new(3, "Socks", 55.00, "Clothing", 0.1)
      discount_1 = QuantityDiscount.new(3, 1) #20.00
      discount_2 = CategoryDiscount.new("Clothing", 0.1, 100) #$12.50
      shopping_cart = ShoppingCart.new([product_1, product_2, product_3])

      discounted_total = DiscountCalculator.apply_discounts(shopping_cart, [discount_1, discount_2])
      assert_equal 92.5, discounted_total
    end
end