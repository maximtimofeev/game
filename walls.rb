require_relative 'horizontal_line'
require_relative 'vertical_line'

# walls
class Walls
  def initialize(map_width, map_height)
    @walls_list = []
    @walls_list << HorizontalLine.new(0, map_width - 2, 0, '+')
    @walls_list << HorizontalLine.new(0, map_width - 2, map_height - 1, '+')
    @walls_list << VerticalLine.new(0, map_height - 1, 0, '+')
    @walls_list << VerticalLine.new(0, map_height - 1, map_width - 2, '+')
  end

  def each(&block)
    @walls_list.each(&block)
    self
  end

  def draw
    @walls_list.each(&:draw)
  end
end
