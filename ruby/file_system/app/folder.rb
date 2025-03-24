class Folder
  attr_reader :parent_directory, :name
  attr_accessor :contents

  def initialize(parent_directory, name, contents)
    @parent_directory = parent_directory
    @name = name
    @contents = contents
  end
  
  def add_content(content)
    contents[content.name] = content
  end
end