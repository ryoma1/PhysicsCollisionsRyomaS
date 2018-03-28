-- Title: PhysicsAndCollisions
-- Name: Ryoma Scott
-- Course: ICS2O/3C
-- In this program a ball will bounce off of a beam and bounce off the floor

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--load physics
local physics = require("physics")

--start physics
physics.start()
---------------------------------------------------------------------------------------
--objects
---------------------------------------------------------------------------------------

--Ground
local ground = display.newImage("Physics/ground.png", 0, 0)

   --Set the x and y position
   ground.x = display.contentCenterX
   ground.y = display.contentHeight

   --change the width to be the same as the screen
   ground.width = display.contentWidth

   --add to physics
   physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-------------------------------------------------------------------------

--create a veritcal beam
local beam = display.newImage("Physics/beam.png", 0, 0)

 --set the x and y position
 beam.x = display.contentCenterX/5
 beam.y = display.contentCenterY*1.65

 --set the beam size
 beam.width = display.contentWidth/2
 beam.height = display.contentHeight/10

 --rotate the beam -60 degrees so its on an angle
 beam:rotate(45)

 --send it to the back layer
 beam:toBack()

 --add to physics
 physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

--create bkg
local bkg = display.newImage("physics/bkg.png", 0, 0)

 --set the x and y position
 bkg.x = display.contentCenterX
 bkg.y = display.contentCenterY

 --set the bkg size
 bkg.width = display.contentWidth
 bkg.height = display.contentHeight

 --send to back
 bkg:toBack()

 ----------------------------------------------------------
 --FUCNTIONS
 ----------------------------------------------------------

 --create the first ball
 local function firstBall()
 	--creating first ball
 	local ball1 = display.newImage("Physics/super_ball.png", 0, 0)

 	--add to physics
 	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

----------------------------------------------------------------------------------

local function secondBall()
	--creating first ball
	local ball2 = display.newImage("Physics/super_ball.png", 0, 0)

	--adding to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	--make it smaller than the original size
	ball2:scale(0.5, 0.5)
end

-----------------------------------------------------------------------------------
--TIMER DELAYS - call each function after the given millisecond
-----------------------------------------------------------------------------------

timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
