require 'pry'
require 'tty-cursor'
require './horizontal_line'
require './vertical_line'

print "\e[8;25;80t"
system 'clear'

upper_line = HorizontalLine.new(0, 78, 0, '*')
lower_line = HorizontalLine.new(0, 78, 24, '*')
left_line = VerticalLine.new(0, 24, 0, '*')
right_line = VerticalLine.new(0, 24, 78, '*')

upper_line.draw
lower_line.draw
left_line.draw
right_line.draw

gets
