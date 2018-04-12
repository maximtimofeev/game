require_relative 'directions'

# point class
class Point
  include Direction
  attr_accessor :x, :y, :symbol

  def initialize(coord_x = 0, coord_y = 0, symbol = '')
    @x = coord_x
    @y = coord_y
    @symbol = symbol
  end

  def draw
    cursor = TTY::Cursor
    print cursor.move_to(@x, @y), @symbol
  end

  def clear
    @symbol = ' '
    draw
  end

  def move(offset, direction)
    case direction
    when UP
      @y += offset
    when RIGHT
      @x += offset
    when DOWN
      @y -= offset
    when LEFT
      @x -= offset
    else
      raise 'Wrong snake\'s direction'
    end
    self
  end

  def to_s
    "x: #{@x}, y: #{@y}, symbol: #{@symbol}"
  end
end
