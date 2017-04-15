require 'rubygems'
require 'gosu'
include Gosu

class Ruby
  def initialize(window, x, y, width, height)
    @width = width
    @height = height
    @x = x
    @y = y
    #radius of the image
    @radius = @width/2
    @window = window
    @ruby = Gosu::Image.new(@window, 'gem.png', :options => true)
    @vx = 5
    @vy = 5
  end

  def draw
    @ruby.draw_rot(@x, @y, 0, 0)
  end

  def move
    if right_wall
      h_bounce
    end

    if left_wall
      h_bounce
    end

    if bottom_wall
      v_bounce
    end

    if top_wall
      v_bounce
    end

    @x += @vx
    @y += @vy
  end

  def right_wall
    @x >= @window.width-@radius
  end

  def left_wall
    @x <= @radius
  end

  def bottom_wall
    @y <= @radius
  end

  def top_wall
    @y >= @window.height-@radius
  end

  def h_bounce
    @vx *= -1
  end

  def v_bounce
    @vy *= -1
  end

end

class Test < Gosu::Window

  def initialize(width=600, height=400, fullscreen=false)
    super
    @ruby = Ruby.new(self, 200, 200, 50, 50)
  end

  def update
    @ruby.move
  end

  def draw
    @ruby.draw
  end

end

Test.new.show
