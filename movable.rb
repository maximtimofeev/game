# movable module
module Movable
  # takes a single character command
  def button_pressed(key)
    case key
    when "\e"
      exit
    when "\e[A", "àH"
      Direction::DOWN
    when "\e[B", "àP"
      Direction::UP
    when "\e[C", "àM"
      Direction::RIGHT
    when "\e[D", "àK"
      Direction::LEFT
    else
      Direction::ERROR
    end
  end
end
