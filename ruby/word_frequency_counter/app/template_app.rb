
# Scenario:
# TODO:
=begin 
Problem: Word Frequency Counter

Write a Ruby program that takes a string of text and returns a hash where the keys are words (case insensitive) and the values are the number of times each word appears in the text.
Requirements:

    Ignore punctuation.
    Treat uppercase and lowercase versions of a word as the same.
    Return the words in alphabetical order in the hash.
=end

def word_frequency(text)
    downcase = text.downcase.delete('^a-zA-Z0-9 ')
    word_array = downcase.split(' ')
    frequency_hash = {}
    word_array.each do |word|
        if frequency_hash.key?(word)
            frequency_hash[word] += 1
        else
            frequency_hash[word] = 1
        end
    end

    return frequency_hash.sort.to_h
end

text = "Hello world! This is a test. Hello again, world."
output = word_frequency(text)
puts output
expected_output = {
    "a" => 1,
    "again" => 1,
    "hello" => 2,
    "is" => 1,
    "test" => 1,
    "this" => 1,
    "world" => 2
}

