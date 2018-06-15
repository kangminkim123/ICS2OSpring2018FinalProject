-----------------------------------------------------------------------------------------
--
-- splashScreen.lua
--
-- Created By Gillian Gonzales  
-- Created On May 15 2018
--
-- This file will show the splash screen
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
 
local scene = composer.newScene()
 
local logo
local background
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 local function showMenu()

    local options = {

    effect = "fade",

    time= 500

    }

    logo:removeSelf()

    composer.gotoScene("scene.mainMenuScene",options)

 end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    background = display.newRect( 1024, 768, 2048, 1536 )
    background:setFillColor( 1,1,1 )
    background.id = "background"
    sceneGroup:insert(background)

    logo = display.newImage("./scene/menu/SplashScreen.PNG",1600,1000)
    logo.x = 1024
    logo.y = 768
    logo.id = "SMT"
    sceneGroup:insert(logo)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
    
    timer.performWithDelay( 2000, showMenu) 

    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene