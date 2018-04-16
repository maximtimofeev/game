require_relative 'point'

# shape class
class Shape
  def initialize
    @point_list = []
  end

  def hit?(point)
    @point_list.include?(point)
  end

  def include?(point)
    @point_list.each do |item|
      return true if item.hit?(point)
    end
    false
  end

  def draw(color = :yellow)
    @point_list.each { |point| point.draw(color) }
  end
end
