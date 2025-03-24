require "minitest/autorun"
require_relative "../app/template_app"

class AreAnagramsTestAppTest < Minitest::Test
    def test_are_anagrams
      output = getAnagramGroups(["thing", "listen", "think", "silent", "night", "inlets"])
      assert_equal [["thing", "night"],
      ["listen", "silent", "inlets"],
      ["think"]], output
    end
end