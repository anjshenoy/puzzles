class TowersOfHanoi
  attr_accessor :disks, :towers
  def initialize(number_of_disks=3, *tower_names)
    self.towers = []
    tower_names.each do |name|
      self.towers << Tower.new(name)
    end
    self.towers.first.load((1..number_of_disks).to_a)
  end


  def tower_a
    self.towers.first
  end

  def tower_b
    self.towers[1]
  end

  def tower_c
    self.towers.last
  end

  def to_s
    "TOWER STATUS:: " + self.towers.map(&:to_s).join(" || ")
  end

end

class Tower
  attr_accessor :name, :disks

  def initialize(name)
    self.name = name
    self.disks = []
  end

  def load(disks)
    disks.each do |d|
      self.disks.push(d)
    end
  end

  def to_s
    "#{self.name}: #{self.disks.inspect}"
  end

  def move(*disks, to, aux)
    disks.flatten!
    return if disks.empty?
    puts "moving #{disks}, from: #{self.name} to: #{to.name}, aux: #{aux.name}, #{self}, #{to}, #{aux}"
    if disks.size == 1
      to.push(self.pop)
      return
    end
    self.move([disks[0...disks.size-1]], aux, to)
    self.move([disks.last], to, aux)
    aux.move([disks[0...disks.size-1]], to, self)
  end

  def push(disk)
    self.disks.insert(0, disk)
  end

  def pop
    self.disks.delete_at(0)
  end
end

h = TowersOfHanoi.new(3,"a","b","c")
h.tower_a.move(h.tower_a.disks, h.tower_c, h.tower_b)
puts h
puts "DONE!!!"
