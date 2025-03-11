require "minitest/autorun"
require_relative "../app/cache"

class LRUCacheAppTest < Minitest::Test
    def test_giant_cache_read
      cache_size = 100000
      cache = LRUCache.new(cache_size)
      cache_size.times do |i|
        cache.set("key#{i}", "value#{i}")
      end

      current_time = Time.now
      puts current_time
      cache.set("afafafa", "random_valule")
      end_time = Time.now
      puts "Operation took: #{end_time - current_time} seconds"
    end
end