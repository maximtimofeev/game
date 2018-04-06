# point class
class Point
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
end
