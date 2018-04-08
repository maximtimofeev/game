require './point'

# shape class
class Shape
  def draw
    @point_list.each(&:draw)
  end
end
