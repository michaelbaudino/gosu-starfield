class Starfield
  attr_reader :velocity, :sprite, :width, :height

  def initialize(width, height)
    @width     = width
    @height    = height
    @max_stars = 2000
    @stars     = Array.new(@max_stars) { Star.new(self) }
    @velocity  = 1.02
    @sprite    = Gosu::Image.new("star.png")
  end

  def draw
    @stars.each &:draw
  end

  def update
    update_velocity!
    update_max_stars!
    kill_old_stars
    create_new_stars
    @stars.each &:update
  end

  def stars_count
    @stars.count
  end

private

  def create_new_stars
    missing_stars = [0, @max_stars - stars_count].max
    @stars += Array.new(missing_stars) { Star.new(self, [@width, @height].sample / 10) }
  end

  def kill_old_stars
    @stars.each do |star|
      @stars.delete(star) if star.out_of_viewport?
    end
  end

  def update_velocity!
    @velocity += 0.005 if Gosu::button_down? Gosu::KbUp
    @velocity -= 0.005 if Gosu::button_down? Gosu::KbDown
    @velocity = 1.0 if @velocity < 1.0
  end

  def update_max_stars!
    @max_stars += 10 if Gosu::button_down? Gosu::KbRight
    @max_stars -= 10 if Gosu::button_down? Gosu::KbLeft
  end
end
