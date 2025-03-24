require_relative "folder" 
class FileDirectory
  attr_accessor :root_node

  def initialize
    @root_node = Folder.new(nil, "~", {})
  end
end

module FileDirectoryOperations

  def self.mkdir(directory, path)
    if path.include? "."
      puts "mkdir cannot create files"
      return
    end

    new_paths = path.split("/")
    cur_folder = directory.root_node
    new_paths.each do |path|
      if cur_folder.contents.key(path)
        puts "Entering folder"
        cur_folder = cur_folder.contents[path]
      else
        puts "Creating folder"
        new_folder = Folder.new(cur_folder, path, {})
        cur_folder.add_content(new_folder)
        cur_folder = new_folder
      end
    end

    return directory
  end
  
  def self.add_file(directory, path, file)
    if !path.include? "."
      puts "add_file cannot create folders"
      return
    end

    paths = path.split("/")
    cur_folder = directory.root_node
    paths.each do |path|
      if path.include? "."
        new_file = File.new(cur_folder, path, file)
        cur_folder.add_content(new_file)
      elif cur_folder.contents.key(path)
        puts "Entering folder"
        cur_folder = cur_folder.contents[path]
      else
        puts "Folder " + path + "does not exist"
      end
    end

    return directory
  end

  def self.read_file(directory, path)
    if !path.include? "."
      puts "read file cannot read folders"
      return
    end

    paths = path.split("/")
    cur_folder = directory.root_node
    paths.each do |path|
      if cur_folder.contents.key(path)
        if path.include? "."
          return cur_folder.contents[path].file_contents
        else
          cur_folder = cur_folder.contents[path]
        end
      else
        puts "Folder " + path + "does not exist"
      end
    end
  end
end
