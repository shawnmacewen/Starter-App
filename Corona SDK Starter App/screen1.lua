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
    
-- Because I am creating the mainView group now and insterting it into the localGroup,
-- any groups that come after would be placed ontop of my mainView,
-- so I can keep adding objects to the mainView without worrying about making
-- objects appear behind the tab bar



-- Tab Bar --

-- The next section I exlain the method I used to create my tab bar. 

-- About it: I choose this method mostly because it is within my skill range, allows me to 
-- make extensive use of director, gives me the button over effect when I am a specific screen.lua 
-- and allows me to use buttons within the body to move to new sub area's of the program

-- Tab Group for nav bar at top 
-- This is the background tab bar image all greay, with the logo on the right
-- You may have noticed as we go along I do not use a perfect science for aligning objects
-- I'm mostly trial and error
local tabBar = display.newImage( "tabBar.png", 0 ,0 )
 	 localGroup:insert(tabBar)
 	 tabBar.x = display.contentWidth * .5
 	 tabBar.y = display.contentHeight * 0 + 178.5


--The buttons are nearly identical, they are made using the ui.lua.


-- Notice how this button has functions, but they do not perform any events,
-- This is so we still get the click effect when you click this button,
-- but you are already on the screen you need to be on.
local button1Press = function( event )
end

local button1Release = function( event )
end

-- You will want to take note of how this button has the default image
-- as the over image already, this is how we create the selected screen/tab effect
-- You will see on each individual screen depending on which tab you select will have 
-- these defaults settings, but the other buttons will have functions and the regular button images.


local button1 = ui.newButton{
  default = "tab_over.png",
  over = "tab.png",
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
	if event.phase == "ended" then
   director:changeScene ("screen4")
	end
end

local button4 = ui.newButton{
  default = "tab.png",
  over = "tab_over.png",
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



-- Notes about this style of tab bar

-- The pros as you can see is we get to do what we set out to do.

-- You will want to open screen2.lua, screen3.lua, screen4.lua to observe how each one
-- has slightly different options for the button that corresponds to the screen you are on.

-- On closer inspection, we only change the default and over button states and 
-- we remove the changeScene event from the buttonRelease function depending on the button.

-- I have so far only encountered three problems with respects to my method

-- 1. Using scrollview can be tricky, you will see an example of this on screen2a.lua
-- ( incase I make changes later, you will want to look for the scrollView sample I
-- will include on screen 2 as a potential work around and talking about the challenges I am having.)

-- 2. The other downfall is we load the tab bar on each screen, so using fancy screen transitions 
-- on your four main screens will not look as good if your mainView ( the body only)
-- could transition but not your tab bar. 

--3. Making changes to these tabs requires you to revisit every instance of your tabs which
-- have the tab bars. This could be a lot if you always use the tab bar. You can avoid this by
-- being 100% sure you know you want those tab bars, or you start to make sub pages, like you 
-- will once again see within the samples section how I stop using the tab bar in further lua files.


-- You can see examples of screen transitions and scrollView on screen2a.lua and how I've 
-- made use of the them.





-- The Body

-- The following outlines the part of the program that is located in Scene 1 which
-- gives you the illusion that there is a sub group.

-- The best way to accomplish this is by first creating all the buttons and functions
-- on one screne, then making copies of your sub screens as you will see 
-- they are named screen1b.lua, screen1c.lua and screen1d.lua in the directory.

-- Notice that each mini news item in this screen is infact a whole new 
-- lua file each time, we still accomplish our goal much like we do with the tab bar.


--News Group background rounded rectangles and text items
local newsGroup = display.newGroup()

local bodyBackground = display.newRoundedRect(0, 0, 150, 100, 12)
bodyBackground.strokeWidth = 2
bodyBackground:setFillColor(255, 255, 255)
bodyBackground:setStrokeColor(200, 200, 200)
bodyBackground.x = display.contentWidth * 1 + 30
bodyBackground.y = display.contentHeight * .32
newsGroup:insert(bodyBackground)

local bodyBackground2 = display.newRoundedRect(300, 0,700, 400, 12)
bodyBackground2.strokeWidth = 2
bodyBackground2:setFillColor(255, 255, 255)
bodyBackground2:setStrokeColor(200, 200, 200)
bodyBackground2.x = display.contentWidth * 0 + 270
bodyBackground2.y = display.contentHeight * .6
newsGroup:insert(bodyBackground2)

local bodyBackground3 = display.newRoundedRect(0, 0, 400, 100, 12)
bodyBackground3.strokeWidth = 2
bodyBackground3:setFillColor(255, 255, 255)
bodyBackground3:setStrokeColor(200, 200, 200)
bodyBackground3.x = display.contentWidth * 0 + 123
bodyBackground3.y = display.contentHeight * .32
newsGroup:insert(bodyBackground3)

 local textDate = display.newText("May, 2011", 0, 0, native.systemFontBold, 16)
textDate:setTextColor(80, 80, 80)
textDate.x = display.contentWidth * .01
textDate.y = display.contentHeight * .30
newsGroup:insert(textDate)  
   
local textNewsTitle = display.newText("Welcome to Starter App !", 0, 0, native.systemFontBold, 24)
textNewsTitle:setTextColor(0, 0, 0)
textNewsTitle.x = display.contentWidth * .14
textNewsTitle.y = display.contentHeight * .33
newsGroup:insert(textNewsTitle)     

 local textYear = display.newText("Year", 0, 0, native.systemFontBold, 16)
textYear:setTextColor(80, 80, 80)
textYear.x = display.contentWidth * 1.035
textYear.y = display.contentHeight * .30
newsGroup:insert(textYear)  
   
local textYearNumber = display.newText("2011", 0, 0, native.systemFontBold, 24)
textYearNumber:setTextColor(0, 0, 0)
textYearNumber.x = display.contentWidth * 1.035
textYearNumber.y = display.contentHeight * .33
newsGroup:insert(textYearNumber)  

local textBigNewsTitle = display.newText("Thank you for trying this App.", 0, 0, native.systemFontBold, 24)
textBigNewsTitle:setTextColor(0, 0, 0)
textBigNewsTitle.x = display.contentWidth * .18
textBigNewsTitle.y = display.contentHeight * .45
newsGroup:insert(textBigNewsTitle)

local textBody = "This starter app was designed as an example application. See current information for more on where to find info about how this app was created.\n\nYou are free to use the code and the assets in your projects. I hope you find it useful. "

local textNewsBody = util.wrappedText( textBody, 60, 20, native.systemFontBold, {80,80,80} )
textNewsBody.x = display.contentWidth * .1 - 125
textNewsBody.y = display.contentHeight * .49
newsGroup:insert(textNewsBody) 

local textStart = "Get Started by selecting a menu option at the top, or viewing another news item using the buttons to the right."

local textNewsBody2 = util.wrappedText( textStart, 60, 20, native.systemFontBold, {180,80,80} )
textNewsBody2.x = display.contentWidth * .1 - 125
textNewsBody2.y = display.contentHeight * .68
newsGroup:insert(textNewsBody2) 

-- Right Menu Group for news items
-- I plan on documenting this in a future revision

-- This is basically another Tab Bar group same as above that exist on every lua related to screen1
-- The minor difference is that we do not highlight the buttons in this tab bar, we use
-- a small white arrow to give the effect we have changed news item
local rightMenuGroup = display.newGroup()

local buttonRM1Press = function( event )
end

local buttonRM1Release = function( event )
end

local buttonRM1 = ui.newButton{
  default = "buttonNewsItem.png",
  over = "buttonNewsItem_over.png",
	onPress = buttonRM1Press,
	onRelease = buttonRM1Release,
  text = "Welcome",
  textColor = { 254, 254, 254, 0 },
  id = "RM1",
  size = 18,
  align = "center",
  emboss = true,
  }
rightMenuGroup:insert(buttonRM1)
buttonRM1.x = display.contentWidth * 1
buttonRM1.y = display.contentHeight * .5

local buttonRM2Press = function( event )
end

local buttonRM2Release = function( event )
	if event.phase == "ended" then
    director:changeScene ("screen1b")
    end
end

local buttonRM2 = ui.newButton{
  default = "buttonNewsItem.png",
  over = "buttonNewsItem_over.png",
	onPress = buttonRM2Press,
	onRelease = buttonRM2Release,
  text = "Current Information",
  textColor = { 254, 254, 254, 0 },
  id = "RM2",
  size = 18,
  align = "center",
  emboss = true,
  }
rightMenuGroup:insert(buttonRM2)
buttonRM2.x = display.contentWidth * 1
buttonRM2.y = buttonRM1.y + 46

local buttonRM3Press = function( event )
end

local buttonRM3Release = function( event )
	if event.phase == "ended" then
    director:changeScene ("screen1c")
    end

end

local buttonRM3 = ui.newButton{
  default = "buttonNewsItem.png",
  over = "buttonNewsItem_over.png",
	onPress = buttonRM3Press,
	onRelease = buttonRM3Release,
  text = "News item 3",
  textColor = { 254, 254, 254, 0 },
  id = "RM3",
  size = 18,
  align = "center",
  emboss = true,
  }
rightMenuGroup:insert(buttonRM3)
buttonRM3.x = display.contentWidth * 1
buttonRM3.y = buttonRM2.y + 46

local buttonContactUsPress = function( event )
end

local buttonContactUsRelease = function( event )
	if event.phase == "ended" then
    director:changeScene ("screen1d")
    end
end

local buttonContactUs = ui.newButton{
  default = "buttonNewsItem.png",
  over = "buttonNewsItem_over.png",
	onPress = buttonContactUsPress,
	onRelease = buttonContactUsRelease,
  text = "Contact Me",
  textColor = { 254, 254, 254, 0 },
  id = "contact",
  size = 18,
  align = "center",
  emboss = true,
  }
rightMenuGroup:insert(buttonContactUs)
buttonContactUs.x = display.contentWidth * 1
buttonContactUs.y = buttonRM3.y + 46

-- This little white arrow is what changes on each sub lua file to show that we
-- are looking at a different news item
local textMiniArrow = display.newText("<", 0, 0, native.systemFontBold, 24)
textMiniArrow:setTextColor(255, 255, 255)
textMiniArrow.x = display.contentWidth * .845
textMiniArrow.y = display.contentHeight * .497
rightMenuGroup:insert(textMiniArrow) 

-- Note how we enter everything into mainView
mainView:insert(rightMenuGroup)
mainView:insert(newsGroup)

   return localGroup
   end