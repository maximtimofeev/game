require 'tty'
require 'colorize'
require_relative 'walls'
require_relative 'snake'
require_relative 'food_creator'

print "\e[8;25;80t"
system 'clear'
system 'cls'

# walls
walls = Walls.new(80, 25)
walls.draw

# snake
point = Point.new(4, 5, '*')
snake = Snake.new(point, 3, Direction::RIGHT)
snake.draw

# create food
food_creator = FoodCreator.new(80, 25, '$')
food = food_creator.create_food
food.draw(:red)

# prompt
prompt = TTY::Prompt.new(interrupt: :exit)

threads = []

threads << Thread.new do
  loop do

    exit if snake.hit?(walls) || snake.eat_self?

    if snake.eat?(food)
      food = food_creator.create_food
      food.draw(:red)
    else
      snake.move
    end
    sleep(0.1)
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

threads.each(&:join)
