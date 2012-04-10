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

  # for every element encoutered that is 0, make its row and column zero
  def custom_zero_row_col
    rows = self.size - 1
    zero_positions = []
    (0..rows).each do |r|
      cols = self[r].size - 1
      (0..cols).each do |c|
        if self[r][c] == 0
          zero_positions << [r,c]
        end
      end
    end
    zero_positions.each do |arr|
      self.zeroify(arr)
    end
    self
  end

  def zeroify(array)
    r,c = array
    (0...self[r].size).each do |col|
      self[r][col] = 0
    end
    (0...self.size).each do |row|
      self[row][c] = 0
    end
  end
end

#puts [[1,2],[3,4]].rotate_clockwise.inspect
#puts [[1,2,3], [4,5,6], [7,8,9]].rotate_clockwise.inspect
#
puts [[1,0,2], [3,4,5], [6,7,9]].custom_zero_row_col.inspect
