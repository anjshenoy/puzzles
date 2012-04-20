class LinkedList

  attr_accessor :head, :last, :min, :max

  def initialize
    self.head = Node.new
    self.min = self.max = nil
  end

  def add_to_head(data)
    n = Node.new(data)
    if self.head.next.nil?
      self.head.next = n
      self.last = n
    else
      x = self.head.next
      self.head.next = n
      n.next = x
    end
    self
  end
  alias_method :push, :add_to_head

  def add_to_tail(data)
    n = Node.new(data)
    if self.head.next.nil?
      self.head.next = n
      self.last = n
    else
      self.last.next = n
      self.last = n
    end
    update_min_max(n)
    self
  end
  alias_method :enqueue, :add_to_tail

  def update_min_max(node)
    update_min(node)
    update_max(node)
  end
  private :update_min_max

  def update_max(node)
    if self.max.nil? || (node > self.max)
      self.max = node
    end
  end
  private :update_max

  def update_min(node)
    if self.min.nil? || (node < self.min)
      self.min = node
    end
  end
  private :update_min

  def drop_last
    n = self.head
    until (n.next == self.last)
      n = n.next
    end
    x = self.last
    self.last = n
    x
  end
  alias_method :dequeue, :drop_last

  def drop_first
    x = self.head.next
    self.head.next = x.next
    x
  end
  alias_method :pop, :drop_first

  def size
    x = self.head
    count = 1
    until(x  == self.last) do
      x = x.next
      count += 1
    end
    count
  end
  alias_method :number_of_nodes, :size

  def exists?(node)
    x = self.head
    until(x == node) do 
      x = x.next
    end
    x == node
  end

  # delete a node given access only to that node
  def delete(node)
    next_node = node.next
    if next_node.nil?
      self.drop_last
    else
      node.data = next_node.data
      node.next = next_node.next
    end
    self
  end

  def to_s
    x = self.head
    str = ""
    until(x == self.last)
      x = x.next
      str <<  "#{x.data} -> "
    end
    str << "nil"
  end

  def print(from, to=self.last)
    n = from
    str = ""
    until (n == to)
      str << "#{n} -> "
      n = n.next
    end
    puts str << to.to_s
  end

  def at(position=1)
    n = self.head.next
    count = 1
    while (count < position && !n.nil?)
      n = n.next
      count += 1
    end
    n
  end

  def remove_duplicates
    hash = {}
    n = self.head.next
    until(n.nil?) do 
      if hash.has_key?(n.data)
        self.delete(n)
      else
        hash[n.data] = 1
      end
      n = n.next
    end
    self
  end

  def remove_duplicates_without_buffer
    n = self.head.next
    until(n.next == self.last) do
      n1 = n.next
      until(n1.nil?) do
        if n.data == n1.data
          if n1 == self.last
            self.delete(n1)
            break
          else
            self.delete(n1)
          end
        else
          n1 = n1.next
        end
      end
      n = n.next
    end
    self
  end

  def add_numbers_from_another_ll(ll)
    x, y = self.head.next, ll.head.next
    newll = LinkedList.new
    carry_over = 0
    while (x && y)
      result = x + y + carry_over
      if result >= 10
        result -= 10
        carry_over = 1
      else
        carry_over = 0
      end
      newll.push(result)
      x = x.next
      y = y.next
    end
    newll
  end

  def make_circle(start_position=1, end_position=self.size)
    n = self.head.next
    count = 1
    while(count < start_position && !n.nil?)
      n = n.next
      count += 1
    end
    start_node = n
    puts "start_node = #{start_node}"
    while(count < end_position && !n.nil?)
      n = n.next
      count += 1
    end
    end_node = n
    puts "end_node = #{end_node}"
    end_node.next = start_node
    puts "end.node.next = #{end_node.next}"
    puts self
    self
  end
end

class Node
  attr_accessor :data, :next

  def initialize(data="")
    self.data = data
  end

  def to_s
    self.data
  end

  def ===(other)
    self.data == other.data
  end

  def +(another_node)
    self.data + another_node.data
  end

  def >(another_node)
    self.data > another_node.data
  end

  def <(another_node)
    self.data < another_node.data
  end
end

##stack
#l = LinkedList.new
#puts l.push("a").push("x").push("c")
#puts l.pop
#puts l
l = LinkedList.new
l.enqueue("z").enqueue("x").enqueue("c")
#l.dequeue
l.enqueue("a").enqueue("b").enqueue("x")
puts l.make_circle(3, 6)
#puts l.circular?
puts l.min
puts l.max
##puts l.remove_duplicates
##puts l.remove_duplicates_without_buffer
#puts l
#puts l.at(3)
#l.print(l.at(3))

#a = LinkedList.new
#a.push(3).push(8).push(6)
#puts a
#b = LinkedList.new.push(4).push(9).push(2)
#puts b
#puts a.add_numbers_from_another_ll(b)
#
