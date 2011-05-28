-- 
-- iPad Starter App sample  
-- Designed and created by Shawn MacEwen for Ansca, Inc. and the community


-- This is designed for use on iPad - Horizontal
-- 
-- Version: 1.0
-- 
-- Sample code is Open Source, image assets are free of use, asking permission
-- is nice if you plan on using the images but not required 
  
  module(..., package.seeall)
   
-- localGroup is always required for use with Director.lua, you will see a closing piece
-- at the bottom of this lua
   local localGroup = display.newGroup()
   function new()
   
 
 -- I am creating a mainView group for my display elements (text,images, etc.)
local mainView = display.newGroup()


-- Inserting a white background sized for iPad horizontal   
local background = display.newRect(-130,0,1026,900)
	mainView:insert(background)		

-- Displaying our logo
-- Note how the logo starts off with a alpha = 0
local logoLarge = display.newImage("logoLarge.png", 0 ,0 )
	logoLarge.alpha = 0
	mainView:insert(logoLarge)
	logoLarge.x = display.contentWidth * .5
	logoLarge.y = display.contentHeight * .5
 
-- This transition provides the fade-in effect for our logo  
transition.to(logoLarge, {time = 2000, alpha = 1})      
   
-- Inserting our mainView into the localgroup
localGroup:insert(mainView)

-- This transition is the logo moving to the top right cornor and shrinking at the same time
local moveLogoLarge = function()	
	
-- The parameters for this transition idicate I want to move the logo to the x and y location
-- I also want to scale it down to 25 % of it's original size using both the xScale and yScale
-- The time indicates 1 second 
		local moveTransition = function()
			transition.to(logoLarge, {time = 1000, x = 774, y = 178, xScale = .25, yScale = .25})
		end
		
-- This timer tells the function when to start
-- You'll notice it starts after 2 seconds of screen time
-- This guys us ample time to perform our fad-in prior to this effect taking place
		moveTimer = timer.performWithDelay( 2000, moveTransition, 1 )
	end

-- This executes our function
	moveLogoLarge()
	
	
	
-- This snippet is the function for automatically moving to the next scene
local showLoadingScreen = function()	
		
--The function we want to perform is having director change the scene
-- I am using the "crossfade" screen effect packaged with director to fade in
-- the screen1.lua which is our main screen with menus
		local goToScreen1 = function()
			director:changeScene( "screen1", "crossfade" )
		end
-- Notice how we have a 3.5 second timer for this one giving us time 
-- for the other effects to get finished
-- The paramters used in the brackets represent ( time, function to be performed, # times to perform function)
		startTimer = timer.performWithDelay( 3500, goToScreen1, 1 )
	end
-- Executes our function
	showLoadingScreen()


-- Very important: You need to the cancel timers 
	unloadMe = function()
		if moveTimer then timer.cancel( moveTimer ); end
		if startTimer then timer.cancel( startTimer ); end
		
-- Cleaning up the logo 
-- Director techincally performs this but I included it for my 
-- loading page to be 100% sure	I clean up this garbage
		if logoLarge then
			logoLarge:removeSelf()
			logoLarge = nil
		end
	end

-- Required for director
   return localGroup
   end