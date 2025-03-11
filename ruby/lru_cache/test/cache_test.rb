require "minitest/autorun"
require_relative "../app/cache"

class LRUCacheAppTest < Minitest::Test

    def test_get_from_cache
      cache = LRUCache.new(2)
      cache.set("key1", "value1")
      assert_equal "value1", cache.get("key1")
    end

    def test_initialize_with_size_less_than_zero
      assert_raises(ArgumentError) { LRUCache.new(0) }
      assert_raises(ArgumentError) { LRUCache.new(-1) }
    end

    def test_get_from_cache_delete_least_recent_item
      cache = LRUCache.new(2)
      cache.set("key1", "value1")
      cache.set("key2", "value2")
      cache.set("key3", "value3")
      assert_nil cache.get("key1")

      assert_equal "value2", cache.get("key2")
      assert_equal "value3", cache.get("key3")
    end

    def test_delete_from_cache
      cache = LRUCache.new(2)
      cache.set("key1", "value1")
      cache.set("key2", "value2")
      #TODO: delete

      cache.delete("key1")

      assert_nil cache.get("key1")
    end

    def test_delete_from_cache_key_does_exist
      cache = LRUCache.new(2)

      assert_nil cache.delete("key1")
    end

    def test_to_h
      cache = LRUCache.new(2)
      cache.set("key1", "value1")
      cache.set("key2", "value2")

      expected = {"key1" => "value1", "key2" => "value2"}
      assert_equal expected, cache.to_h
    end

    def test_clear_cache
      cache = LRUCache.new(2)
      cache.set("key1", "value1")
      cache.set("key2", "value2")

      cache.clear
      assert_equal({}, cache.to_h)
    end

    def test_count
      cache = LRUCache.new(2)
      cache.set("key1", "value1")
      cache.set("key2", "value2")

      assert_equal(2, cache.count)
    end

    def test_giant_cache_read
      cache_size = 100000000000000
      cache = LRUCache.new(100000000000000)
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