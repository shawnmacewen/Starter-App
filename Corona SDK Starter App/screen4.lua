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
   
-- Required for director   
   local localGroup = display.newGroup()
   function new()
   
-- I always create a mainView when I start to act as the body of my app for everything
-- below the Tab Bar at the top
local mainView = display.newGroup()   

-- Creating the white background 
-- The sizes are not exact but they work for this project to cover the background
local background = display.newRect(-130,220,1026,680)
	background:setFillColor(210,210,210)
	mainView:insert(background)

-- This adds mainView to the localgroup   
    localGroup:insert(mainView)
    

-- Tab Bar --

-- Tab Group for nav bar at top 

local tabBar = display.newImage( "tabBar.png", 0 ,0 )
 	 localGroup:insert(tabBar)
 	 tabBar.x = display.contentWidth * .5
 	 tabBar.y = display.contentHeight * 0 + 178.5


--The buttons are nearly identical, they are made using the ui.lua.

local button1Press = function( event )
end

local button1Release = function( event )
	if event.phase == "ended" then
    director:changeScene ("screen1")
    end
end



local button1 = ui.newButton{
  default = "tab.png",
  over = "tab_over.png",
	onPress = button1Press,
	onRelease = button1Release,
  text = "Welcome",
  textColor = { 0, 0, 0 },
  id = "button1",
  size = 24,
  align = "center",
  emboss = true,
  }

-- we insert any objects that are a part of the tab bar into the localGroup and not the mainView
localGroup:insert(button1)

-- Positioning is key on the first button. Once again no exact science here, trial and error 
button1.x = display.contentWidth * .5 - 430
button1.y = display.contentHeight * 0 + 178.5


-- Button 2 has the changeScene function that tells director to change the scene when 
-- you are done clicking the button
local button2Press = function( event )
end

local button2Release = function( event )
  if event.phase == "ended" then
     director:changeScene ("screen2") 
 end
end

-- The non selected buttons will all share the default image,
-- you can reference the tab.png and tab_over.png in the directory if you need to see
-- the difference

local button2 = ui.newButton{
  default = "tab.png",
  over = "tab_over.png",
	onPress = button2Press,
	onRelease = button2Release,
  text = "Samples",
  textColor = { 0, 0, 0 },
  id = "button2",
  size = 24,
  align = "center",
  emboss = true,
  }
localGroup:insert(button2)

-- Notice how positiong the buttons after the first is much easier,
-- we reference button1's location and just move it right on the x
-- plane by the exact width in pixels of the button
button2.x = button1.x + 170
button2.y = button1.y

-- Button 3 will be a lot like button 2, only it changes to a different scene

local button3Press = function( event )
end

local button3Release = function( event )
	if event.phase == "ended" then
   director:changeScene ("screen3")
	end
end

local button3 = ui.newButton{
  default = "tab.png",
  over = "tab_over.png",
	onPress = button3Press,
	onRelease = button3Release,
  text = "Tab 3",
  textColor = { 0, 0, 0 },
  id = "button3",
  size = 24,
  align = "center",
  emboss = true,
  }
localGroup:insert(button3)

-- We position button 3 relative to button 2
button3.x = button2.x + 170
button3.y = button2.y

local button4Press = function( event )
end

local button4Release = function( event )
end

local button4 = ui.newButton{
  default = "tab_over.png",
  over = "tab.png",
	onPress = button4Press,
	onRelease = button4Release,
  text = "Tab 4",
  textColor = { 0, 0, 0 },
  id = "button4",
  size = 24,
  align = "center",
  emboss = true,
  }
localGroup:insert(button4)

-- button 4 is relative to button 3
button4.x = button3.x + 170
button4.y = button3.y

-- Tab Bar end



-- The Body

-- Screen 4 Body

-- I'm still using the News Group background rounded rectangles and text items from before

local newsGroup = display.newGroup()

local bodyBackground3 = display.newRoundedRect(0, 0, 400, 100, 12)
bodyBackground3.strokeWidth = 2
bodyBackground3:setFillColor(255, 255, 255)
bodyBackground3:setStrokeColor(200, 200, 200)
bodyBackground3.x = display.contentWidth * 0 + 123
bodyBackground3.y = display.contentHeight * .32
newsGroup:insert(bodyBackground3)

 local textDate = display.newText("screen4.lua", 0, 0, native.systemFontBold, 16)
textDate:setTextColor(80, 80, 80)
textDate.x = display.contentWidth * .03
textDate.y = display.contentHeight * .30
newsGroup:insert(textDate)  
   
local textNewsTitle = display.newText("Tab 4", 0, 0, native.systemFontBold, 24)
textNewsTitle:setTextColor(0, 0, 0)
textNewsTitle.x = display.contentWidth * .0
textNewsTitle.y = display.contentHeight * .33
newsGroup:insert(textNewsTitle)     


mainView:insert(newsGroup)

   return localGroup
   end