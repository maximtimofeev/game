require 'pry'
require 'tty'
require_relative 'horizontal_line'
require_relative 'vertical_line'
require_relative 'snake'

print "\e[8;25;80t"
system 'clear'
system 'cls'

# frame
upper_line = HorizontalLine.new(0, 78, 0, '+')
lower_line = HorizontalLine.new(0, 78, 24, '+')
left_line = VerticalLine.new(0, 24, 0, '+')
right_line = VerticalLine.new(0, 24, 78, '+')

upper_line.draw
lower_line.draw
left_line.draw
right_line.draw

# snake
point = Point.new(4, 5, '*')
snake = Snake.new(point, 70, Direction::RIGHT)
snake.draw
snake.move

prompt = TTY::Prompt.new(interrupt: :exit)

threads = []

threads << Thread.new do |url|
    loop do
      sleep(0.1)
      snake.move
    end
end

threads << Thread.new do
  loop do 
    prompt.on(:keypress) do |event|
      snake.handle_key(event.value)
    end
    prompt.read_keypress
  end
end

threads.each {|thr| thr.join }
