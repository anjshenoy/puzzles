def subsets(set)
  return [set] if set.size == 1 
  ss = [set]
  set.each{|x| 
   ss += subsets(set.reject{|el| el == x})
  }
  return ss.sort.uniq
end

puts subsets([1,2,3]).inspect
