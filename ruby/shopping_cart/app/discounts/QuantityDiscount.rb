require_relative "AbstractDiscount"

class QuantityDiscount < AbstractDiscount
  attr_reader :threshold, :free_item_quanity

  def initialize(threshold, free_item_quanity)
    @threshold = threshold
    @free_item_quanity = free_item_quanity
    freeze
  end

  def self.apply_discount(shopping_cart, discount)
    return 0.0 unless QuantityDiscount.is_valid?(shopping_cart, discount)
    sorted_items = shopping_cart.items.sort_by(&:price)
    free_items = sorted_items[0, discount.free_item_quanity]
    return free_items.map(&:price).sum
  end

  def self.is_valid?(shopping_cart, discount)
    if discount.is_a?(QuantityDiscount)
      return shopping_cart.items.length >= discount.threshold
    else
      return false
    end
  end
end