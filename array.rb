class Array
  def transpose
    rows = self.size
    cols = self.size
    mid = ((rows-1)/2).floor
    (0...rows).each do |r|
      (0...cols).each do |c|
        puts "swapping: #{self[r][c]} #{self[c][r]}"
        if (r < mid) || (r > mid && c >= mid)
          self[r][c], self[c][r] = self[c][r], self[r][c]
        end
      end
    end
    self
  end

  def swap_rows
    n = self.size - 1
    mid = (n/2).floor
    (0..n).each do |r|
      (0..mid).each do |c|
        puts "swapping #{self[r][c]}, #{self[r][n-c]}"
        self[r][c], self[r][n-c] = self[r][n-c], self[r][c]
      end
    end
    self
  end

  def rotate_clockwise
    self.transpose.swap_rows
  end
end

puts [[1,2],[3,4]].rotate_clockwise.inspect
puts [[1,2,3], [4,5,6], [7,8,9]].rotate_clockwise.inspect
