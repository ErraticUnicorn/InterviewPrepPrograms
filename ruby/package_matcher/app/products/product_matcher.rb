module ProductMatcher

  def self.match(products)
    instantiated_products = {
      Product::CAMERA => [],
      Product::GAMING_CONSOLE => [],
      Product::BLUETOOTH_SPEAKER => []
    }
    products.each do |product|
      case product
      when "Cam"
        instantiated_products[Product::CAMERA] = instantiated_products[Product::CAMERA] + [Camera.new()]
      when "Game"
        instantiated_products[Product::GAMING_CONSOLE] = instantiated_products[Product::GAMING_CONSOLE] + [GamingConsole.new()]
      when "Blue"
        instantiated_products[Product::BLUETOOTH_SPEAKER] = instantiated_products[Product::BLUETOOTH_SPEAKER] + [Bluetooth.new()]
      else
        raise_error "Uknown Product given!"
      end
    end

    boxes = []
    # Iterate through instances products, treat array as a queue. Figure out product and product sizes in order to figure out boxing strategy.
    # i.e. if we have 5 Cameras, we need 2 large boxes and 1 medium box since the camera quantity is Medium: 1, Large: 2
    # if we have 5 Gaming Consoles, we need 3 large boxes since the gaming console quantity is Large: 2
    # if we have 5 Bluetooth Speakers, we need 5 large boxes since the bluetooth speaker quantity is Large: 1
    instantiated_products.each do |product, instances|
      next if instances.empty?
    
      # Sort sizes by efficiency (items per box, descending)
      sizes = instances.first.sizes.sort_by { |size| -size.quantity }
      
      remaining = instances.size
      boxes_to_create = []
      
      # First pass: calculate optimal packing
      sizes.each do |size|
        box_type = size.box_type
        capacity = size.quantity
        
        # Use this size as long as we have enough items to make it efficient
        while remaining >= capacity
          boxes_to_create << [box_type, capacity]
          remaining -= capacity
        end
      end
      
      # Second pass: handle remaining items with the smallest appropriate box
      if remaining > 0
        appropriate_size = sizes.reverse.find { |size| size.quantity >= remaining } || sizes.last
        boxes_to_create << [appropriate_size.box_type, remaining]
        remaining = 0
      end
      
      # Create the actual boxes
      boxes_to_create.each do |box_type, item_count|
        contents = []
        item_count.times do
          product_to_pack = instances.shift
          contents << product_to_pack.identifier_to_string if product_to_pack
        end
        boxes << Box.new(box_type, contents)
      end
    end

    return boxes
  end

end