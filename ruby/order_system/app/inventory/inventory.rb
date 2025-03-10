class Inventory
  attr_reader :items

  #items is a dictionary with item_id and key being quantity
  def initialize(items)
    @items = items
    freeze
  end

  def self.is_avaialable?(item, inventory)
    return inventory[item] != 0
  end
end