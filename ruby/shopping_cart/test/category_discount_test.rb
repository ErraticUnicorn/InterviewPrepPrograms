require "minitest/autorun"
require_relative "../app/shopping_cart"
require_relative "../app/product"
require_relative "../app/discounts/CategoryDiscount"

class CategoryDiscountTest < Minitest::Test
    def test_apply_discount_invalid
      category_discount = CategoryDiscount.new("Clothing", 0.1, 100)
      shopping_cart = ShoppingCart.new([])
      product = Product.new(1, "T-shirt", 20.00, "Clothing", 0.2)
      shopping_cart = ShoppingCart.add_item(shopping_cart, product)
      assert_equal 0.0, CategoryDiscount.apply_discount(shopping_cart, category_discount)
    end

    def test_apply_discount_valid
      product_1 = Product.new(1, "T-shirt", 20.00, "Clothing", 0.2)
      product_2 = Product.new(2, "Jeans", 75.00, "Clothing", 0.8)
      product_3 = Product.new(3, "Socks", 5.00, "Clothing", 0.1)
      shopping_cart = ShoppingCart.new([product_1, product_2, product_3])
      category_discount = CategoryDiscount.new("Clothing", 0.1, 100)
      assert_equal 10.0, CategoryDiscount.apply_discount(shopping_cart, category_discount)
    end
end