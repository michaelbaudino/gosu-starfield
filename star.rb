class Star
  def initialize(starfield, birth_radius = nil)
    @starfield = starfield
    birth_radius ||= [@starfield.width / 2, @starfield.height / 2].max
    @x = rand(-birth_radius..birth_radius)
    @y = rand(-birth_radius..birth_radius)
  end

  def draw
    @starfield.sprite.draw(@x + @starfield.width / 2, @y + @starfield.height / 2, 1, 0.5, 0.5)
  end

  def update
    @x *= @starfield.velocity
    @y *= @starfield.velocity
  end

  def out_of_viewport?
    @x < -@starfield.width / 2 ||
    @x >  @starfield.width / 2 ||
    @y < -@starfield.height    ||
    @y >  @starfield.height
  end
end
