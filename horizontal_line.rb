require './point'

# horizontal_line class
class HorizontalLine
  def initialize(left_x, right_x, coord_y, symbol)
    @point_list = []
    (left_x..right_x).each do |coord_x|
      @point_list << Point.new(coord_x, coord_y, symbol)
    end
  end

  def draw
    @point_list.each(&:draw)
  end
end
