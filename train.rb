require_relative 'company_manufacturer'

class Train

  include CompanyName

  attr_reader :speed, :wagons, :number

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number, speed = 0)
    @number = number
    @speed  = speed
    @wagons =[]
    @@trains[number] = self
  end

  def self.trains
    @@trains
  end

  def break
    @speed = 0
  end

  def take_wagon(wagon)
    @wagons << wagon if wagon.type == self.type && @speed == 0
  end


  def leave_wagon(wagon)
    @wagons.pop if @wagons.any? && @speed == 0
  end


  def set_route(route)
    @route = route
    @index_station = 0
    current_station.arrival_train(self)
  end

  def forward
    current_station.departure_train(self)
    @index_station += 1
    current_station.arrival_train(self)
  end

  def back
    current_station.departure_train(self)
    @index_station -= 1
    current_station.arrival_train(self)
  end

  def current_station
    @route.stations[@index_station]
  end

  def previous_station
    @route.stations[@index_station - 1]
  end

  def next_station
    @route.stations[@index_station + 1]
  end

  protected # единственное, что здесь можно поместить в protected,
  # чтобы ничто из вне не могло установить отрицательную скорость

  def accelerate(num)
    @speed += num
  end

end
