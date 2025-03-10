module OrderService

  def self.create_order(customer_id, items, inventory)
    order = Order.new(SecureRandom.uuid, customer_id, items)
    items.each do |item|
      if !Inventory.is_available?(item, inventory)
        puts "Item #{item} is not available in inventory."
        return Order.cancel(order)
      end
    end
    
    return order
  end
end
