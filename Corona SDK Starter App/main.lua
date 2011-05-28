-- 
-- iPad Starter App sample  
-- Designed and created by Shawn MacEwen for Ansca, Inc. and the community


-- This is designed for use on iPad - Horizontal
-- 
-- Version: 1.0
-- 
-- Sample code is Open Source, image assets are free of use, asking permission
-- is nice if you plan on using the images but not required 

-- Credit to the authors of many of the excellent tools and code snippets,
-- used throughout this program, many thanks. And to Ansca mobile for creating
-- an excellent platform accessible to everyone. 

display.setStatusBar (display.HiddenStatusBar)
--> Hides the status bar


--import external classes
local director = require("director")
local ui = require("ui")
local scrollView = require("scrollView")
local util = require("util")
local fps = require("fps")


local mainGroup = display.newGroup()
--> Creates a main group

local function main()
--> Adds main function

-- This next piece of code is to check for memory leaks and show overall performance
--
--[[
 local performance = fps.PerformanceOutput.new();
performance.group.x, performance.group.y = display.contentWidth * .9,  display.contentHeight * .15;
performance.alpha = 0.2
--]]

	mainGroup:insert(director.directorView)
	--> Adds the group from director

	director:changeScene("screen2b")
	--> Change the scene, no effects

	return true
end

main()
--> Starts our app
