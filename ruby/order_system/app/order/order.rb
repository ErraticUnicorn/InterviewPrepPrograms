class Order
  include OrderStatus
  attr_reader :id, :customer_id, :items, :status

  def initialize(id, customer_id, items, status = OrderStatus::PENDING) 
    @id = id
    @customer_id = customer_id
    @items = items
    @status = status
    freeze
  end

  def self.cancel(order)
    return Order.new(order.id, order.customer_id, order.items, OrderStatus::CANCELLED)
  end
end