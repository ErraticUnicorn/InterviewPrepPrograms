class LRUCache

  def initialize(max_size)
    raise ArgumentError, "max_size must be greater than 0" if max_size <= 0
    @max_size = max_size
    # In Ruby, cache keys are stored by order of first write
    @cache = {}
  end

  def get(key)
    return nil unless @cache.key?(key)
    # Make sure key is moved in the array by removing it and reinserting it
    value = @cache[key]
    replace_key(key, value)
    value
  end

  def set(key, value)
    if @cache.key?(key)
      # Update existing key
      replace_key(key, value)
    elsif @cache.size >= @max_size
      # Remove the least recently used key
      key_to_be_evicted = @cache.keys[0]
      delete(key_to_be_evicted)
    end
    # Add new key
    @cache[key] = value
  end

  def delete(key)
    return unless @cache.key?(key)

    @cache.delete(key)
  end

  def to_h
    @cache
  end

  def clear
    #clear every value of cache
    @cache.clear
  end

  def count
    @cache.size
  end

  def replace_key(key, value)
    @cache.delete(key)
    @cache[key] = value
  end
end