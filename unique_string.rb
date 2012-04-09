# in place modification to make a string unique
class String
  def unique
    @last = self.size - 1
    i = 0
    while(i <= @last - 1) do
      j = i + 1
      while(j <= @last) do
        if self[i] == self[j]
          if j == @last
            @last = j - 1
            next
          end
          p = self.first_position_not_eq_char_at(j)
          if p == nil #all chars after j are the same
            @last = j-1
          else
            self.copy_chars(p, @last, j)
            @last = j + (@last - p)
          end
        end
        j += 1
      end
      i += 1
    end
    self[0..@last]
  end

  def first_position_not_eq_char_at(position)
    x = self[position]
    (position+1..@last).each do |p|
      if x != self[p]
        return p
      end
    end
    nil
  end

  def copy_chars(from, to, start_position)
    i = 0
    (from..to).each do |p|
      self[start_position + i] = self[p]
      i += 1
    end
  end
end

puts "aaaaa".unique
puts "abcde".unique
puts "aaaka".unique
puts "ababa".unique
