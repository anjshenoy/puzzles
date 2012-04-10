class String
  def encode_space_with_html_val
    string2 = ""
    self.chars.each_with_index do |c, index|
      if c == " "
        string2 << "%20"
      else
        string2 << c
      end
    end
    string2
  end
end

puts "ab cd".encode_space_with_html_val
