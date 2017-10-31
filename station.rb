class Station

  attr_reader :trains, :name

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def arrival_train(train)
    @trains << train
  end

  def departure_train(train)
    @trains.delete(train)
  end

  def list_by_type(type)
    num = 0
    @trains.each {|traintype| num += 1 if traintype == type}
  end

  def self.all
    @@stations
  end

  #def self.all
    #ObjectSpace.each_object(self).to_a
  #end

end