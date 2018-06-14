-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-- Created by: Mr. Coxall
-- Created on: Apr 2018
-- 
-- This file makes the menu appear
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local fx = require( "com.ponywolf.ponyfx" )
local tiled = require( "com.ponywolf.ponytiled" )
local json = require( "json" )

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local level0
local level1
local level2
local level3
local level4
local level5
local level6
local level7
local level8
local level9
local level10
local level11
local level12
local level13
local level14
local level15

local scene = composer.newScene()

-- 'onRelease' event listener for level0
local function onlevel0Release()
	
	-- go to level0.lua scene
	composer.gotoScene( "scene.level0", { params = {} } )
	
	return true	-- indicates successful touch
end
	
-- 'onRelease' event listener for level1
local function onlevel1Release()
	
	-- go to level1.lua scene
	composer.gotoScene( "scene.level1", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level2
local function onlevel2Release()
	
	-- go to level2.lua scene
	composer.gotoScene( "scene.level2", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level0
local function onlevel3Release()
	
	-- go to level3.lua scene
	composer.gotoScene( "scene.level3", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level4
local function onlevel4Release()
	
	-- go to level4.lua scene
	composer.gotoScene( "scene.level4", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level5
local function onlevel5Release()
	
	-- go to level5.lua scene
composer.gotoScene( ".scene.level5", { params = {} } )

	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level6
local function onlevel6Release()
	
	-- go to level6.lua scene
	composer.gotoScene( "scene.level6", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level7
local function onlevel7Release()
	
	-- go to level7.lua scene
	composer.gotoScene( "scene.level7", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level8S
local function onlevel8Release()
	
	-- go to level0.lua scene
	composer.gotoScene( "scene.level8", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level9
local function onlevel9Release()
	
	-- go to level9.lua scene
	composer.gotoScene( "scene.level9", { params = {} } )

	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level10
local function onlevel10Release()
	
	-- go to level10.lua scene
	composer.gotoScene( "scene.level10", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level11
local function onlevel11Release()
	
	-- go to level11.lua scene
	composer.gotoScene( "scene.level11", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level12
local function onlevel12Release()
	
	-- go to level12.lua scene
	composer.gotoScene( "scene.level12", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level13
local function onlevel13Release()
	
	-- go to level13.lua scene
	composer.gotoScene( "scene.level13", { params = {} })
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level14
local function onlevel14Release()
	
	-- go to level0.lua scene
	composer.gotoScene( "scene.level14", { params = {} } )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level15
local function onlevel15Release()
	
	-- go to level0.lua scene
	composer.gotoScene( "scene.level15", { params = {} } )
	
	return true	-- indicates successful touch
end


function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "./assets/sprites/menu/levelSelectScreen.png", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	
	-- create/position logo/title image on upper-half of the screen
	--local titleLogo = display.newImageRect( "./assets/sprites/menu/logo.png", 264, 42 )
	--titleLogo.x = display.contentCenterX
	--titleLogo.y = 100
	
	-- create a level buttons
	level0 = widget.newButton{
		label = "Level 0",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel0Release	-- event listener function
	}
	level0.x = 200
	level0.y = 200

	level1 = widget.newButton{
		label = "Level 1",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel1Release	-- event listener function
	}
	level1.x = 200
	level1.y = 400

	level2 = widget.newButton{
		label = "Level 2",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel2Release	-- event listener function
	}
	level2.x = 200
	level2.y = 600

	level3 = widget.newButton{
		label = "Level 3",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel3Release	-- event listener function
	}
	level3.x = 200
	level3.y = 800

	level4 = widget.newButton{
		label = "Level 4",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel4Release	-- event listener function
	}
	level4.x = 200
	level4.y = 1000

	level5 = widget.newButton{
		label = "Level 5",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel5Release	-- event listener function
	}
	level5.x = 200
	level5.y = 1200

	level6 = widget.newButton{
		label = "Level 6",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel6Release	-- event listener function
	}
	level6.x = 1000
	level6.y = 200

	level7 = widget.newButton{
		label = "Level 7",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel7Release	-- event listener function
	}
	level7.x = 1000
	level7.y = 400

	level8 = widget.newButton{
		label = "Level 8",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel8Release	-- event listener function
	}
	level8.x = 1000
	level8.y = 600

	level9 = widget.newButton{
		label = "Level 9",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel9Release	-- event listener function
	}
	level9.x = 1000
	level9.y = 800

	level10 = widget.newButton{
		label = "Level 10",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel10Release	-- event listener function
	}
	level10.x = 1000
	level10.y = 1000

	level11 = widget.newButton{
		label = "Level 11",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel11Release	-- event listener function
	}
	level11.x = 1000
	level11.y = 1200

	level12 = widget.newButton{
		label = "Level 12",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel12Release	-- event listener function
	}
	level12.x = 1800
	level12.y = 200

	level13 = widget.newButton{
		label = "Level 13",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel13Release	-- event listener function
	}
	level13.x = 1800
	level13.y = 400

	level14 = widget.newButton{
		label = "Level 14",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel14Release	-- event listener function
	}
	level14.x = 1800
	level14.y = 600

	level15 = widget.newButton{
		label = "Level 15",
		fontSize = 48*2,
		labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel15Release	-- event listener function
	}
	level15.x = 1800
	level15.y = 800

	
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	--sceneGroup:insert( titleLogo )
	sceneGroup:insert( level0 )
	sceneGroup:insert( level1 )
	sceneGroup:insert( level2 )
	sceneGroup:insert( level3 )
	sceneGroup:insert( level4 )
	sceneGroup:insert( level5 )
	sceneGroup:insert( level6 )
	sceneGroup:insert( level7 )
	sceneGroup:insert( level8 )
	sceneGroup:insert( level9 )
	sceneGroup:insert( level10 )
	sceneGroup:insert( level11 )
	sceneGroup:insert( level12 )
	sceneGroup:insert( level13 )
	sceneGroup:insert( level14 )
	sceneGroup:insert( level15 )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.

	-- widgets must be manually removed
	level0:removeSelf()	
	level0 = nil

	level1:removeSelf()	
	level1 = nil

	level2:removeSelf()	
	level2 = nil

	level3:removeSelf()	
	level3 = nil

	level4:removeSelf()	
	level4 = nil

	level5:removeSelf()	
	level5 = nil

	level6:removeSelf()	
	level6 = nil

	level7:removeSelf()	
	level7 = nil

	level8:removeSelf()	
	level8 = nil

	level9:removeSelf()	
	level9 = nil

	level10:removeSelf()	
	level10 = nil

	level11:removeSelf()	
	level11 = nil

	level12:removeSelf()	
	level12 = nil

	level13:removeSelf()	
	level13 = nil

	level14:removeSelf()	
	level14 = nil

	level15:removeSelf()	
	level15 = nil

	level16:removeSelf()	
	level16 = nil

	level17:removeSelf()	
	level17 = nil
	
	--if level0 then
	--	level0:removeSelf()	-- widgets must be manually removed
	--	level0 = nil
	--end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene