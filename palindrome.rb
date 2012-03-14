#2 solutions

class String

  #1. start at beginning
  # compare first and last
  # if equal 
  #  increment index position by 1 and repeat
  #else 
  # return false
  def palindrome?
    last = self.size-1
    middle = (last/2).floor
    (0..middle).each do |i|
      unless self[i] == self[last-i]
        return false
      end
    end
    return true
  end

  #2. start at the middle
  # if string length is even 
  # compare with char to right
  # if string length is odd
  # compare char to left of middle with char to right of middle
  # if comparision is successfull
  # continue
  # else
  # return false
    def palindrome_m?
      middle = ((self.size-1)/2).floor
      (0..middle).each do |i|
        if self.size.even? && !(self[middle-i] == self[middle+i+1])
          return false
        elsif self.size.odd? && !(self[middle-i] == self[middle+i])
          return false
        end
      end
      return true
    end
end


puts "malayalam".palindrome?
puts "malayalam".palindrome_m?
puts "asd".palindrome?
puts "asd".palindrome_m?


puts "abba".palindrome?
puts "abba".palindrome_m?
