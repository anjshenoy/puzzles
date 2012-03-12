#find anagrams in a list of n words
#
class Anagram

  def self.find_in_list(words = [])
    anagrams = {}
    words.each do |word|
      hash = word.chars.sort.hash
      if(anagrams.has_key?(hash))
        anagrams[hash] << word
      else
        anagrams[hash] = [word]
      end
    end
    anagrams.select{|key, word_pairs| word_pairs.size > 1}.each do |key_value|
      key, value = key_value
      puts value.join(", ")
    end
  end
end

words = %w(key fek god dog goo doo asd das hello yello)
Anagram.find_in_list(words)
