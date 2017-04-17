# Introduction to Gosu
## What is Gosu?
[Gosu](https://www.libgosu.org/) is a 2d game development library for [Ruby](https://www.ruby-lang.org/en/) and [C++](http://www.cplusplus.com/). It is available for [macOS](https://github.com/gosu/gosu/wiki/Getting-Started-on-OS-X), [Windows](https://github.com/gosu/gosu/wiki/Getting-Started-on-Windows), [Linux](https://github.com/gosu/gosu/wiki/Getting-Started-on-Linux) (including [Raspbian](https://github.com/gosu/gosu/wiki/Getting-Started-on-Raspbian-%28Raspberry-Pi%29)), as well as [iOS](https://www.libgosu.org/cpp.html). This tutorial will focus on macOS, so if you're using the other operating systems, we've included handy-dandy links to their installation ways. 

Gosu is a lightweight engine with few dependencies, and provides:
* a window and a main loop
* 2D graphics and text, powered by OpenGL or OpenGL ES
* sounds and music
* keyboard, mouse, and gamepad input

## Installation
Since we are using Ruby with Gosu, Ruby must be installed into your computer. 

#### Step One

In order to install Ruby into your computer, [Homebrew](https://brew.sh/) (a package manager for Mac) is necessary! So, let's do that first.
* PS, the install scripts are to be pasted onto your Terminal (since you're learning Gosu, we're going to assume you know what a Terminal is), but location is irrelevent because yay global installs!
 ```
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
#### Step Two 

Now that Homebrew is installed, it's Ruby's turn!
```
$ brew install ruby
```
#### Step Three

We've successfully installed both Homebrew and Ruby; let's take look at Gosu again. Like we mentioned before, Gosu has few dependencies, an important one being the [SDL 2 Library](http://www.libsdl.org/). In order for Gosu to actually work, let's install that, too.
```
brew install sdl2
```
#### Step Four

Final installation - it's time for the one we've all been waiting for: Gosu!
```
gem install gosu
```
Let's test that out real quick with this one-liner. If everything's been correctly installed, a window should pop up after hitting enter.
```
ruby -rgosu -e 'w = Gosu::Window.new(200, 150); w.caption = "It works!"; w.show'
```
If that worked, Install Fest was successful! :partyparrot:

#### Gosu-Examples

One of the great things about Gosu are the example games it provides. Install and run the ```gosu-examples``` (check out the code [here](https://github.com/gosu/gosu-examples)!) gem:
```
gem install gosu-examples
gosu-examples
```
A few of these games require the following additional libraries:
```
gem install chipmunk
```
* [Chipmunk2D](https://chipmunk-physics.net/) is a simple, lightweight, fast and portable 2D rigid body physics library written in C. 
```
gem install rmagick
```
* [RMagick](http://rmagick.rubyforge.org/) is an interface between the Ruby programming language and the ImageMagick® and GraphicsMagick image processing libraries.
```
gem install opengl
```
* [OpenGL](https://www.opengl.org/) is the premier environment for developing portable, interactive 2D and 3D graphics applications.

## Let's Make a Thing!

The best way to learn a new framework or language is to make a simple game or app. We're going to render a ruby in our Gosu window and implement movement to it.

#### Step One: Gosu Window

![Step One](http://i.imgur.com/r6BKWv0.png)
* require ruby and gosu, include Gosu
* class Tester inherits from Gosu::Window
* initialize method takes three parameters: width, height, fullscreen
* call on class Tester with Tester.new.show

Now you have a Gosu Window!

![Step One A](http://i.imgur.com/vxS9esd.png)

#### Step Two: Rendering an Image in the Window

![Step Two](http://i.imgur.com/1lw8kMK.png)
* create a class Ruby
* initialize method takes four parameters: window, x, y, width, height
* create instance variables that equal to those parameters! (ex: @width = width, @height = height)
* note: the radius will be equal to the width divided by 2
* the instance variable for your ruby image will contain three parameters- window, image location, as well as options
* now that we've initialized our Ruby class, we'll fill out the draw method:
* call the image instance variable and 


![Step Two A](http://i.imgur.com/IBcQYBz.png)

Now that we've created our image class, let's implement it in class Tester!
* we've previously created two unused method in class Tester: the draw method and the update method; we'll be using the draw method now.
* in the draw method, refer to your image instance variable and accompany it with a ".draw"! easy peasy.
* in the initialize method, we'll call on the image instance variable once more, and fill out the parameters we called on in the class Ruby initialize method
* remember initialize(window, x, y, width, height)? 


Yay, a ruby! 

![Step Two B](http://i.imgur.com/SIDq6uf.png)

We're not done yet, though! Gosu is a gaming library, after all, and gaming involves movement. Our next step is to implement movement to the image.

#### Step Three: Movement

The following code belongs in your class Ruby

![Step Three](http://i.imgur.com/dYC7LzE.png)
* here we create the following methods: move, right_wall, left_wall, bottom_wall, top_wall, h_bounce, and v_bounce


![Step Three A](http://i.imgur.com/VuzgGFJ.png)
* in the move method, we're going to call on the methods created in the previous image. the "if" statements are telling the ruby "if you hit this wall, do 'this'"

![Step Three B](http://i.imgur.com/iwIHBX7.png)
(my skill in drawing circles is impeccable)
* in this image, we're adding velocity to both the x-axis and the y-axis. this belongs in the initialize method of class Ruby

We've got movement! Go, ruby, go!

![gif](https://i.gyazo.com/7db1fd534f3f0c14df85fcfff5921896.gif)

#### Step Four: Background Image

Thus far, we've seen how easy it is to render a Gosu window, add a player to the screen, and make it movable. Now we're going to add a background image, and marvel at its' simplicity!

In the initialize method of class Tester, we provided parameters indicating the height and width of the window. The more we learn about Gosu (and Ruby, by extension), the more we realize there's different ways of doing things. Let's switch it up a bit by commenting our that line of code and placing our new height and width right next to super.

![Step Four](http://i.imgur.com/6DcLDtW.png)
* Test that out!

Next up, we're going to create a new instance variable in class Tester for our background image. Indicated by my fabulous red dots, we see it created in the initialize method, then called in the draw method.

![http://i.imgur.com/rFr2k7w.png](http://i.imgur.com/rFr2k7w.png)
* Note: Pay attention to the comments

Go ruby, go clouds!
![ruby cloud gif](https://i.gyazo.com/3f82f5cab6b76427281fa64c3be71e07.gif)


#### Step Five: Adding Multiple Images

We're going to add multiple images to our game. In order to do that, we're going to change our ```@ruby``` instance method so it's more reuseable. 

![Step Five](http://i.imgur.com/dyKEmO7.png)


![Step Five A](http://i.imgur.com/ZgkXpmT.png)
* these instance variables are created in the initialize method of class Tester

![Step Five B](http://i.imgur.com/b4SM7C2.png)
* now that we've initialized an array and random instance variable, we'll incorporate that into some new methods!
* note: we're still in class Tester for these methods

![Step Five C](http://i.imgur.com/U5148Sj.png)
* in order for the user to actually render multiple images, we'll create a button down method that says: "If the space button is pressed, create another ruby." Then we're going to throw in a little surprise turtle! "If the T button is pressed, create a turtle!"

![turtle ruby gif](https://i.gyazo.com/cbbe7815f9d5216c11c9e6ae389086a9.gif)

Look at that, guys! We've managed to create a Gosu Window, a background image, and two moveable images- what a great way to start your game!


