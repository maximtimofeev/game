require 'pry'
require 'tty-cursor'
require './point'

system 'cls'

point1 = Point.new(1, 3, '*')
point2 = Point.new(4, 5, '#')

point1.draw
point2.draw

gets
