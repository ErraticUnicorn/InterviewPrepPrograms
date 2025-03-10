
# Scenario:
# TODO:
=begin
Order Processing System

You're designing an order processing system for an e-commerce platform. The system should allow customers to place orders and process them efficiently while handling concurrency concerns.
Requirements:

    Customers can place orders with a list of items and their quantities.
    Inventory must be checked before an order is confirmed.
    Orders are processed concurrently but should not allow overselling.
    The system should support cancellations before an order is shipped.
    The system should be functional and immutable where possible.

Considerations:

    How will you ensure thread safety when multiple orders are placed simultaneously?
    How would you implement order cancellation efficiently?
    What data structures would you use to track inventory and orders?

Try implementing a basic functional version and then think through how to scale it!
=end

require_relative 'inventory/inventory'
require_relative 'inventory/item'
require_relative 'order/order'
require_relative 'order/order_status'

#initialize inventory
items = {
    1 => 10,
    2 => 5,
    3 => 0
}

inventory = Inventory.new(items)



