# create food in random point
class FoodCreator
  def initialize(screen_width, screen_height, symbol)
    @screen_width = screen_width
    @screen_height = screen_height
    @symbol = symbol
  end

  def create_food
    coord_x = rand(2..(@screen_width - 2))
    coord_y = rand(2..(@screen_height - 2))
    Point.new(coord_x, coord_y, @symbol)
  end
end
