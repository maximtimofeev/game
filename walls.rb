require_relative 'horizontal_line'
require_relative 'vertical_line'

# walls
class Walls
  def initialize(map_width, map_height)
    @shape_list = []
    shape_list << HorizontalLine.new(0, map_width-2, 0, '+')
    shape_list << HorizontalLine.new(0, map_width-2, map_height-1, '+')
    shape_list << VerticalLine.new(0, map_height-1, 0, '+')
    shape_list << VerticalLine.new(0, map_height-1, map_width-2, '+')
  end

  def hit?
    
  end

  def draw
    shape_list.each(&:draw)
  end
end 