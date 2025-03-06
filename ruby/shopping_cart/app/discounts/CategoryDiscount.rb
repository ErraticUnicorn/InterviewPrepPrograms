require_relative "AbstractDiscount"

class CategoryDiscount < AbstractDiscount
  attr_reader :category, :discount_percentage, :threshold

  def initialize(category, discount_percentage, threshold)
    @category = category
    @discount_percentage = discount_percentage
    @threshold = threshold
    freeze
  end

  def self.apply_discount(shopping_cart, discount)
    return 0.0 unless CategoryDiscount.is_valid?(shopping_cart, discount)
    return shopping_cart.items.select { |item| item.category == discount.category }.map(&:price).sum * discount.discount_percentage
  end

  def self.is_valid?(shopping_cart, discount)
      if discount.is_a?(CategoryDiscount)
        # Sum the prices of all items in the shopping cart that belong to the category
        return shopping_cart.items.select { |item| item.category == discount.category }.map(&:price).sum >= discount.threshold
      else
        return false
      end
  end
end