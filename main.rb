require 'tty'
require 'colorize'
require_relative 'walls'
require_relative 'snake'
require_relative 'food_creator'

FIELD_WIDTH = 80
FIELD_HEIGHT = 25
SCORE_MESSAGE = 'Total score: '

print "\e[8;27;80t"
system 'clear'
system('cls')

def print_score(score)
  cursor = TTY::Cursor
  print cursor.move_to(SCORE_MESSAGE.length, FIELD_HEIGHT), score * 100
end

def game_over
  cursor = TTY::Cursor
  center_x = FIELD_WIDTH / 2 - 4
  center_y = FIELD_HEIGHT / 2
  print cursor.move_to(center_x, center_y), 'Game over!'
  print cursor.move_to(0, FIELD_HEIGHT), "Total score:\n"
  print cursor.move_to(0, FIELD_HEIGHT + 1)
  exit
end

# walls
walls = Walls.new(FIELD_WIDTH, FIELD_HEIGHT)
walls.draw
print TTY::Cursor.move_to(0, FIELD_HEIGHT), SCORE_MESSAGE, 0

# snake
point = Point.new(4, 5, '*')
snake = Snake.new(point, 3, Direction::RIGHT)
snake.draw

# create food
food_creator = FoodCreator.new(FIELD_WIDTH, FIELD_HEIGHT, '$')
food = food_creator.create_food
food.draw(:red)

# prompt
prompt = TTY::Prompt.new(interrupt: :exit)

threads = []

threads << Thread.new do
  loop do

    game_over if snake.hit?(walls) || snake.eat_self?

    if snake.eat?(food)
      print_score(snake.points_eated)
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
