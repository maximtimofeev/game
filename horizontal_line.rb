require_relative 'shape'

# horizontal_line class
class HorizontalLine < Shape
  def initialize(left_x, right_x, coord_y, symbol)
    super()
    (left_x..right_x).each do |coord_x|
      @point_list << Point.new(coord_x, coord_y, symbol)
    end
  end
end
