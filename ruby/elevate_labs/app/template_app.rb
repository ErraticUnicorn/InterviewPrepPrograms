
# Scenario:
=begin 
TODO
areAnagrams

areAnagrams(string, string) -> boolean

areAnagrams("thing", "night") -> true
"thing" "ghint"
areAnagrams("listen", "silent") -> true
areAnagrams("think", "night") -> false

Section Two:
getAnagramGroups(array[string]) -> array[][]
getAnagramGroups(["thing", "listen", "think", "silent", "night", "inlets"])
output:
    [
        ["thing", "night"],
        ["listen", "silent", "inlets"],
        ["think"],
    ]
=end

def areAnagrams(anagram_1, anagram_2)
    if anagram_1.length != anagram_2.length
        return false
    end

    anagram_1_character_count = Hash.new(0)
    anagram_2_character_count = Hash.new(0)

    anagram_1.split("").each do |char|
        anagram_1_character_count[char] += 1
    end

    anagram_2.split("").each do |char|
        anagram_2_character_count[char] += 1
    end

    anagram_1_character_count.keys.each do |key|
        if anagram_2_character_count.key?(key)
            if anagram_1_character_count[key] != anagram_2_character_count[key]
                return false
            end
        else
            return false
        end
    end

    return true
end

def getAnagramGroups(list_of_words)
    outputs = []
    anagram_set = Set.new([])
    
    # n -> sliced n
    list_of_words.each_with_index do |word, index|
        anagram_check = [word]
        if anagram_set.include?(word)
            next
        end

        if index + 1 <= list_of_words.length
            list_of_words[index + 1..list_of_words.length].each do |comparison_word|
                if areAnagrams(word, comparison_word)
                    anagram_set.add(comparison_word)
                    anagram_check += [comparison_word]
                end
            end
        end
        outputs.push(anagram_check)
    end

    return outputs
end
