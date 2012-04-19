class LinkedList

  attr_accessor :head, :last

  def initialize
    self.head = Node.new
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
    self
  end
  alias_method :enqueue, :add_to_tail

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

  def exists?(node)
    x = self.head
    until(x == node) do 
      x = x.next
    end
    x == node
  end


  # delete a node given access only to that node
  def delete(node)
    x = self.head
    until(x == node)
      x = x.next
    end
    if (x == node)
      next_node = x.next
      x.data = next_node.data
      x.next = next_node.next
    end
  end

  def print
    x = self.head
    str = ""
    until(x == self.last)
      x = x.next
      str <<  "#{x.data} -> "
    end
    puts str << "nil"
  end

end

class Node
  attr_accessor :data, :next

  def initialize(data=nil)
    self.data = data
  end

  def to_s
    self.data
  end
end

#stack
l = LinkedList.new
l.push("a").push("x").push("c").print
puts l.pop
l.print
l = LinkedList.new
l.enqueue("a").enqueue("x").enqueue("c").print
puts l.dequeue
l.print





