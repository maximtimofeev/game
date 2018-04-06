require 'pry'
require 'tty-cursor'

def draw(row, col, symbol)
  cursor = TTY::Cursor
  print cursor.move_to(row, col), symbol
end

system 'cls'

x1 = 1
y1 = 3
char1 = '*'
draw(x1, y1, char1)

x2 = 4
y2 = 5
char2 = '#'
draw(x2, y2, char2)

gets
