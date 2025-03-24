require "minitest/autorun"
require_relative "../app/file_directory"

class TemplateAppTest < Minitest::Test
    def test_mkdir
      file_directory = FileDirectory.new()
      file_dir = FileDirectoryOperations.mkdir(file_directory, "a/b")
      assert_equal 1, file_dir.root_node.contents.size
      assert_equal 1, file_dir.root_node.contents["a"].contents.size
      assert_equal 0, file_dir.root_node.contents["a"].contents["b"].contents.size
    end

    def test_add_and_read_file
      file_directory = FileDirectory.new()
      file_dir = FileDirectoryOperations.mkdir(file_directory, "a/b")
      file_dir = FileDirectoryOperations.add_file(file_dir, "a/b/test.txt", "Hello World")

      assert_equal FileDirectoryOperations.read_file(file_dir, "a/b/test.txt")
    end
end