require "gosu"

require "./star.rb"
require "./starfield.rb"

class GameWindow < Gosu::Window
  def initialize
    super(800, 800, false)
    self.caption = "Starfield"
    @font        = Gosu::Font.new(20)
    @starfield   = Starfield.new(800, 800)
  end

  def draw
    @starfield.draw
    @font.draw("Stars: #{@starfield.stars_count}", 10, 10, 999, 1.0, 1.0, 0xffffff00)
    @font.draw("Velocity: #{((@starfield.velocity - 1) * 100).round}", 10, 30, 999, 1.0, 1.0, 0xffffff00)
  end

  def update
    close if Gosu::button_down? Gosu::KbEscape
    @starfield.update
  end
end

GameWindow.new.show
