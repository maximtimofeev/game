# movable module
module Movable
  # takes a single character command
  def button_pressed(key)
    case key
    when "\e"
      exit
    when "\e[A"
      Direction::DOWN
    when "\e[B"
      Direction::UP
    when "\e[C"
      Direction::RIGHT
    when "\e[D"
      Direction::LEFT
    else
      Direction::ERROR
    end
  end
end