class AbstractDiscount
  def self.apply_discount(shopping_cart, discount)
    raise NotImplementedError, "#{self.class} must implement apply_discount"
  end

  def self.is_valid?(shopping_cart, discount)
      raise NotImplementedError, "#{self.class} must implement is_valid"
  end
end
