require 'pry'
require 'tty-cursor'
require './horizontal_line'

system 'cls'

h_l = HorizontalLine.new(0, 10, 10, '*')

h_l.draw

gets
