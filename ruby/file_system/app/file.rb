class File
  attr_reader :parent_directory, :name, :file_contents

  def initialize(parent_directory, name, file_contents)
    @parent_directory = parent_directory
    @name = name
    @file_contents = file_contents
    freeze
  end
end