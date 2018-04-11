require_relative 'point'

# shape class
class Shape
  def initialize
    @point_list = []
  end

  def draw
    @point_list.each(&:draw)
  end
end
