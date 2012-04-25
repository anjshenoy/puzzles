def subsets(set)
  return [set] if set.size == 1 
  ss = [set]
  set.each{|x| 
   ss += subsets(set.reject{|el| el == x})
  }
  return ss.sort.uniq
end

#puts subsets([1,2,3]).inspect

def perm(str)
  return [str] if str.size == 1 || str.empty?
  result = []
  (0...str.size).each do |i|
    perm(str[0...i] + str[i+1...str.size]).each do |s|
      result <<  s + str[i]
    end
  end
  result
end

puts perm("abc").inspect
