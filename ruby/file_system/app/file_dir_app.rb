
# Scenario:
=begin
Problem: File System

Design a simplified in-memory file system that supports the following operations:
Operations:

    mkdir(path) – Creates a new directory at the given path.
        Example: fs.mkdir("/a/b") creates directories /a and /a/b if they don’t exist.
        If the directory already exists, do nothing.

    add_file(path, content) – Creates a file at the given path with the given content.
        Example: fs.add_file("/a/b/c.txt", "Hello") creates c.txt under /a/b/.

    read_file(path) – Returns the content of a file.
        Example: fs.read_file("/a/b/c.txt") should return "Hello".

    ls(path) – Lists files and directories in lexicographic order.
        Example:
            fs.ls("/")  #=> ["a"]
            fs.ls("/a") #=> ["b"]
            fs.ls("/a/b") #=> ["c.txt"]

    Example Usage:
        fs = FileSystem.new
        fs.mkdir("/a/b")
        fs.add_file("/a/b/c.txt", "Hello")
        puts fs.read_file("/a/b/c.txt") #=> "Hello"
        puts fs.ls("/")  #=> ["a"]
        puts fs.ls("/a/b") #=> ["c.txt"]

    Requirements:

    The file system should be implemented as an in-memory data structure.
    It should efficiently handle deep directory structures.
    ls should return directories and files in lexicographic order.
=end

def sample_function()
    return "Hello World"
end


# loop do
#     puts "Greetings, User!"
#     command = gets.chomp.upcase
#     if command
#         puts "Invalid command"
#     end
# end
