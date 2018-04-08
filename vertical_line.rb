require './shape'

# vertical_line class
class VerticalLine < Shape
  def initialize(top_y, bottom_y, coord_x, symbol)
    @point_list = []
    (top_y..bottom_y).each do |coord_y|
      @point_list << Point.new(coord_x, coord_y, symbol)
    end
  end
end
