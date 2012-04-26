def paren(n=1)
  return ["()"] if n == 1
  p = []
  paren(n-1).each do |x|
    p << "()" + x
    offset = 0
    until((idx = x.index("(", offset)).nil?) do
      p << x.dup.insert(idx+1, "()")
      offset = idx + 1
    end
  end
  p.uniq
end

puts paren(2).inspect
puts paren(3).inspect
puts paren(4).inspect
