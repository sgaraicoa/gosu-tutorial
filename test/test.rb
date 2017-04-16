require 'rubygems'
require 'gosu'
include Gosu

class Ruby
  def initialize(window, x, y, width, height, image)
    @width = width
    @height = height
    @x = x
    @y = y
    #radius of the image
    @radius = @width/2
    @window = window
    # takes the image passed everytime a new Ruby instance is created
    @ruby = Gosu::Image.new(@window, image, :options => true)
    @vx = 1
    @vy = 1
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

  def initialize #(width=600, height=400, fullscreen=false)
    super 800, 500
    @ruby = Ruby.new(self, 200, 200, 50, 50, 'ruby.png')
    @rubies = Array.new
    @randy = Random.new
    @background_image = Gosu::Image.new("fancy-court.png", :tileable => true)
    # @ruby= Ruby.new(self, @randy.rand(200), @randy.rand(200), 50, 50)

  end
#just triggers when key id is true and adds the imaged passed depending on the key_down
  def add_new_ruby(id, image)
    if id 
      @new_ruby= Ruby.new(self, @randy.rand(600), @randy.rand(400), 50, 50, image)
      @rubies.push(@new_ruby)
    end
  end
#goes every 60 frames so every 60 frames it goes through the array and adds move
  def update
    @ruby.move
    @rubies.each{ |ruby| ruby.move }
    # @ruby= Ruby.new(self, @randy.rand(600), @randy.rand(400), 50, 50)
    # @rubies.push(@ruby)
    # @rubies.each {|ruby| ruby.move} if add_new_ruby
    # @ruby_two = Ruby.new(self, 200, 200, 50, 50)
  end
#add passing id
  def button_down(id)
    if id == Gosu::KB_SPACE
      add_new_ruby(id, 'ruby.png')
      # passes now the image as well depending on two different keystrokes
    elsif id == Gosu::KB_T
      add_new_ruby(id, 'turtle.png')
    else
      super
    end
  end

  def draw
    @background_image.draw(0, 0, 0)
    @ruby.draw
    @rubies.each {|ruby| ruby.draw}
  end

end

Test.new.show 
