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

**Step One**

In order to install Ruby into your computer, [Homebrew](https://brew.sh/) (a package manager for Mac) is necessary! So, let's do that first.
* PS, the install scripts are to be pasted onto your Terminal (since you're learning Gosu, we're going to assume you know what a Terminal is), but location is irrelevent because yay global installs!
 ```
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
**Step Two** 

Now that Homebrew is installed, it's Ruby's turn!
```
$ brew install ruby
```
**Step Three** 

We've successfully installed both Homebrew and Ruby; let's take look at Gosu again. Like we mentioned before, Gosu has few dependencies, an important one being the [SDL 2 Library](http://www.libsdl.org/). In order for Gosu to actually work, let's install that, too.
```
brew install sdl2
```
**Step Four**

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

One of the great things about Gosu are the example games it provides. Install and run the ```gosu-examples``` gem:
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
