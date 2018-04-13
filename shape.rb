require_relative 'point'

# shape class
class Shape
  def initialize
    @point_list = []
  end

  def draw(color = :yellow)
    @point_list.each { |point| point.draw(color) }
  end
end
