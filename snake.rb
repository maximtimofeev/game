require_relative 'shape'
require_relative 'directions'

# snake class
class Snake < Shape
  include Direction
  def initialize(tail, length, direction)
    super()
    length.times do |time|
      point = Point.new(tail.x, tail.y, tail.symbol)
      point.move(time, direction)
      @point_list << point
    end
  end
end
