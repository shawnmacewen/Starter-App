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
   
   local mainView = display.newGroup() 
   
 -- This adds mainView to the localgroup   
    localGroup:insert(mainView)
   
-- Tab Group for nav bar at top 


local tabBar = display.newImage( "tabBarPlain.png", 0 ,0 )
 	 localGroup:insert(tabBar)
 	 tabBar.x = display.contentWidth * .5
 	 tabBar.y = display.contentHeight * 0 + 178.5


    
-- I always create a mainView when I start to act as the body of my app for everything
-- below the Tab Bar at the top
  

-- Creating the white background 
-- The sizes are not exact but they work for this project to cover the background
local background = display.newRect(-130,220,1026,680)
	background:setFillColor(210,210,210)
	mainView:insert(background)



-- Notice no tab bar group
local buttonBackPress = function( event )
end

local buttonBackRelease = function( event )
  if event.phase == "ended" then
     director:changeScene ("screen2", "moveFromLeft") 
 end
end

local buttonBack = ui.newButton{
  default = "tab.png",
  over = "tab_over.png",
	onPress = buttonBackPress,
	onRelease = buttonBackRelease,
  text = "< Back",
  textColor = { 0, 0, 0 },
  id = "back",
  size = 24,
  align = "center",
  emboss = true,
  }
localGroup:insert(buttonBack)
buttonBack.x = display.contentWidth * .5 - 430
buttonBack.y = display.contentHeight * 0 + 178.5



-- Setup a scrollable content group
local topBoundary = display.contentHeight * 0 + 220
local bottomBoundary = display.screenOriginY
local scrollView = scrollView.new{ top=topBoundary, bottom=bottomBoundary }

local myText = display.newText("News", 0, 0, native.systemFontBold, 16)
myText:setTextColor(0, 0, 0)
myText.x = math.floor(display.contentWidth*0.5)
myText.y = 48
scrollView:insert(myText)

-- add some text to the scrolling screen
local lotsOfText = "The key to having this work with director is that the scroll group is positioned to the right of the button so the hit area never overlaps the button. The hit area is indicated in white.\n\nFiller Text - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet consectetur euismod. Phasellus non ipsum vel eros vestibulum consequat. Integer convallis quam id urna tristique eu viverra risus eleifend.\n\nAenean suscipit placerat venenatis. Pellentesque faucibus venenatis eleifend. Nam lorem felis, rhoncus vel rutrum quis, tincidunt in sapien. Proin eu elit tortor. Nam ut mauris pellentesque justo vulputate convallis eu vitae metus. Praesent mauris eros, hendrerit ac convallis vel, cursus quis sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, dui in vehicula dapibus, lorem nisi placerat turpis, quis gravida elit lectus eget nibh. Mauris molestie auctor facilisis.\n\nCurabitur lorem mi, molestie eget tincidunt quis, blandit a libero. Cras a lorem sed purus gravida rhoncus. Cras vel risus dolor, at accumsan nisi. Morbi sit amet sem purus, ut tempor mauris.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet consectetur euismod. Phasellus non ipsum vel eros vestibulum consequat. Integer convallis quam id urna tristique eu viverra risus eleifend.\n\nAenean suscipit placerat venenatis. Pellentesque faucibus venenatis eleifend. Nam lorem felis, rhoncus vel rutrum quis, tincidunt in sapien. Proin eu elit tortor. Nam ut mauris pellentesque justo vulputate convallis eu vitae metus. Praesent mauris eros, hendrerit ac convallis vel, cursus quis sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, dui in vehicula dapibus, lorem nisi placerat turpis, quis gravida elit lectus eget nibh. Mauris molestie auctor facilisis.\n\nCurabitur lorem mi, molestie eget tincidunt quis, blandit a libero. Cras a lorem sed purus gravida rhoncus. Cras vel risus dolor, at accumsan nisi. Morbi sit amet sem purus, ut tempor mauris. "

local lotsOfTextObject = util.wrappedText( lotsOfText, 60, 24, native.systemFont, {0,0,0} )
scrollView:insert(lotsOfTextObject)
lotsOfTextObject.x = 60
lotsOfTextObject.y = math.floor(myText.y + myText.height)

-- Important! Add a background to the scroll view for a proper hit area
local scrollBackground = display.newRect(50, 0, display.contentWidth * 1.35, scrollView.height+64)
scrollBackground:setFillColor(255, 255, 255)
scrollView:insert(1, scrollBackground)

scrollView:addScrollBar()

mainView:insert(scrollView)


   return localGroup
   end