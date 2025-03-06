
=begin
Shopping Cart Discount System
Problem Description
Create a shopping cart system that can apply various discount rules to items. The system should follow these requirements:

Customers can add and remove products to their cart
Products have attributes: id, name, price, category, and weight
The system needs to calculate the total price with applicable discounts
Implement the following discount rules:
Quantity discount: Buy X get Y free (e.g., buy 2 get 1 free)
Bundle discount: Reduced price when buying specific combinations
Category discount: X% off when spending over $Y in a specific category
Shipping discount: Free shipping when order meets weight or price threshold

Requirements
Use an immutable design approach
Write clear tests demonstrating the behavior
Make the discount rule system flexible and extensible
Handle edge cases (negative quantities, zero prices)
=end

cart = ShoppingCart.new([])
product1 = Product.new(1, "T-shirt", 20.00, "Clothing", 0.2)
product2 = Product.new(2, "Jeans", 50.00, "Clothing", 0.8)

# Add products
cart = ShoppingCart.add_item(cart, product1, 3)
cart = ShoppingCart.add_item(cart, product2, 1)

# Apply discount rules
rules = [
  QuantityDiscount.new(product1.id, 2, 1),
  CategoryDiscount.new("Clothing", 0.1, 60.0)
]

# Calculate totals
subtotal = ShoppingCart.calculate_subtotal(cart)

puts "Subtotal: #{subtotal}"

discounted_total = DiscountCalculator.apply_discounts(cart, rules)

puts "Discounted Subtotal: #{discounted_total}"
