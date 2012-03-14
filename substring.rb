class String
  def has_substring?(substring="")
    last_index = self.size-substring.size
    (0..last_index).each do |i|
      (0...substring.size).each do |j|
        if !(self[i+j] == substring[j])
          break
        elsif j == substring.size-1
          return true
        end
      end
    end
    return false
  end
end

puts "abcda".has_substring?("cda")
puts "sdfdsf".has_substring?("x")
