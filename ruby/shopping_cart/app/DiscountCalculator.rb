module DiscountCalculator
  #TODO: Business logic would live here, do we only apply one discount? All of them? Do they sum up?
  def self.apply_discounts(cart, rules)
    total_discount = rules.reduce(0) do |total, rule|
      discount = rule.class.apply_discount(cart, rule)
      puts "Calculated discount: #{discount}"
      total + discount
    end
    total = ShoppingCart.calculate_price(cart) - total_discount
    if total < 0 
      return 0.0
    else
      return total
    end
  end
end