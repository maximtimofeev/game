require_relative 'shape'
require_relative 'directions'
require_relative 'movable'

# snake class
class Snake < Shape
  include Direction
  include Movable
  attr_accessor :direction

  def initialize(tail, length, direction)
    super()
    length.times do |time|
      point = Point.new(tail.x, tail.y, tail.symbol)
      point.move(time, direction)
      @point_list << point
      @direction = direction
    end
  end

  def move
    @point_list.first.clear
    @point_list.shift
    @point_list << next_point
    @point_list.last.draw
  end

  def handle_key(key)
    direction = button_pressed(key)
    if direction != ERROR
      @direction = direction
    end
  end

  private

  def next_point
    head = @point_list.last
    next_head = Point.new(head.x, head.y, head.symbol)
    next_head.move(1, @direction)
    next_head
  end
end
