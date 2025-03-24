require "minitest/autorun"
require_relative "../app/template_app"

class TemplateAppTest < Minitest::Test
    def test_anagram_length
      assert_equal false, areAnagrams("abc", "abcd")
    end

    def test_are_anagrams
      assert_equal true, areAnagrams("thing", "night")
      assert_equal true, areAnagrams("listen", "silent")
    end

    def test_is_not_anagram
      assert_equal false, areAnagrams("think", "night")
    end
end