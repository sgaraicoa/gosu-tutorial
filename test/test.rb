require 'rubygems'
require 'gosu'
include Gosu

class Table
  attr_accessor :x, :y, :width, :height, :color

  def initialize(window, x, y, width, height, color)
    #defining x and y axis
    @x = x
    @y = y
    #defining size
    @width = width
    @height = height
    @color = color
    @window = window
  end

  def draw
    #draw_quad(x1, y1, c1, x2, y2, c2, x3, y3, c3, x4, y4, c4, z = 0, mode = :default)
    # points are in clockwise order
    @window.draw_quad @x, @y, @color, @x + @width, @y, @color, @x + @width, @y + @height, @color, @x, @y + @height, @color
  end
end

class Ball
  def initialize(window)
    @width = 50
    @height = 50
    @x = 200
    @y = 200
    #radius of the image
    @radius = @width/2
    @window = window
    @ball = Gosu::Image.new(window, 'gem.png', true)
    # @speed = 5
    @vx = 5
    @vy = 5
  end

  def draw
    @ball.draw_rot(@x, @y, 0, 0)
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
    @ball = Ball.new(self)
    @table = Table.new(self, 0, 400, 640, 100, Color::WHITE)
  end

  def update
    @ball.move
  end

  def draw
    @table.draw
    @ball.draw
  end

end

Test.new.show
