
-- Include modules/libraries
local composer = require( "composer" )
local fx = require( "com.ponywolf.ponyfx" )
local tiled = require( "com.ponywolf.ponytiled" )
local physics = require( "physics" )
local json = require( "json" )
local scoring = require( "scene.game.lib.score" )
local heartBar = require( "scene.game.lib.heartBar" )

-- Variables local to scene
local map, hero, shield, parallax

-- Create a new Composer scene
local scene = composer.newScene()

-- This function is called when scene is created
function scene:create( event )

	local sceneGroup = self.view  -- Add scene display objects to this group

	-- Are we running on the Corona Simulator?
	-- https://docs.coronalabs.com/api/library/system/getInfo.html
	local isSimulator = "simulator" == system.getInfo( "environment" )
	local isMobile = ( "ios" == system.getInfo("platform") ) or ( "android" == system.getInfo("platform") )

	-- If we are running in the Corona Simulator, enable debugging keys
	-- "F" key shows a visual monitor of our frame rate and memory usage
	if isSimulator then 

		-- Show FPS
		local visualMonitor = require( "com.ponywolf.visualMonitor" )
		local visMon = visualMonitor:new()
		visMon.isVisible = false

		local function debugKeys( event )
			local phase = event.phase
			local key = event.keyName
			if phase == "up" then
				if key == "f" then
					visMon.isVisible = not visMon.isVisible 
				end
			end
		end
		-- Listen for key events in Runtime
		-- See the "key" event documentation for more details:
		-- https://docs.coronalabs.com/api/event/key/index.html
		Runtime:addEventListener( "key", debugKeys )
	end

	-- This module turns gamepad axis events and mobile accelerometer events into keyboard
	-- events so we don't have to write separate code for joystick, tilt, and keyboard control
	require( "com.ponywolf.joykey" ).start()

	-- add virtual joysticks to mobile 
	system.activate("multitouch")
	if isMobile or isSimulator then
		local vjoy = require( "com.ponywolf.vjoy" )
		local stick = vjoy.newStick()
		stick.x, stick.y = 128, display.contentHeight - 128
		local button = vjoy.newButton()
		button.x, button.y = display.contentWidth - 128, display.contentHeight - 128
	end


	-- Sounds
	local sndDir = "scene/game/sfx/"
	scene.sounds = {
		thud = audio.loadSound( sndDir .. "thud.mp3" ),
		sword = audio.loadSound( sndDir .. "sword.mp3" ),
		squish = audio.loadSound( sndDir .. "squish.mp3" ),
		slime = audio.loadSound( sndDir .. "slime.mp3" ),
		wind = audio.loadSound( sndDir .. "loops/space.wav" ),
		door = audio.loadSound( sndDir .. "door.mp3" ),
		hurt = {
			audio.loadSound( sndDir .. "hurt1.mp3" ),
			audio.loadSound( sndDir .. "hurt2.mp3" ),
		},
		hit = audio.loadSound( sndDir .. "hit.mp3" ),
		coin = audio.loadSound( sndDir .. "ghulaab2.wav" ),
		ghulaab = audio.loadSound( sndDir .. "ghulaab2.wav" ),
	}
    
	-- Start physics before loading map
	physics.start()
	physics.setGravity( 0, 32 )
	physics.setDrawMode("normal")

	-- Load our map

	--local filename = event.params.map or "scene/game/map/sandbox.json"
	local filename = "./assets/maps/level8.json"
	local mapData = json.decodeFile( system.pathForFile( filename, system.ResourceDirectory ) )
	--map = tiled.new( mapData, "scene/game/map" )
	map = tiled.new( mapData, "assets/maps" )
	--map.xScale, map.yScale = 0.85, 0.85

	-- Find our hero!
	map.extensions = "scene.game.lib."
	map:extend( "hero" )
	hero = map:findObject( "hero" )
	hero.filename = filename

	-- Find our enemies and other items
	map:extend( "blob", "enemy", "exit", "coin", "spikes", "ghulaab" )

	-- Find the parallax layer
	parallax = map:findLayer( "parallax" )

	-- Add our scoring module
	local gem = display.newImageRect( sceneGroup, "scene/game/img/gem.png", 64, 64 )
	gem.x = display.contentWidth - gem.contentWidth / 2 - 24
	gem.y = display.screenOriginY + gem.contentHeight / 2 + 20
	
	scene.score = scoring.new( { score = event.params.score } )
	local score = scene.score
	score.x = display.contentWidth - score.contentWidth / 2 - 32 - gem.width
	score.y = display.screenOriginY + score.contentHeight / 2 + 16

	-- Add our hearts module
	shield = heartBar.new()
	shield.x = 48
	shield.y = display.screenOriginY + shield.contentHeight / 2 + 16
	hero.shield = shield

	-- Touch the sheilds to go back to the main...
	function shield:tap(event)
		fx.fadeOut( function()
				composer.gotoScene( "scene.levelSelectScene")
			end )
	end
	shield:addEventListener("tap")

	-- Insert our game items in the correct back-to-front order
	sceneGroup:insert( map )
	sceneGroup:insert( score )
	sceneGroup:insert( gem )
	sceneGroup:insert( shield )

end

-- Function to scroll the map
local function enterFrame( event )

	local elapsed = event.time

	-- Easy way to scroll a map based on a character
	if hero and hero.x and hero.y and not hero.isDead then
		local x, y = hero:localToContent( 0, 0 )
		x, y = display.contentCenterX - x, display.contentCenterY - y
		map.x, map.y = map.x + x, map.y + y
		-- Easy parallax
		if parallax then
			parallax.x, parallax.y = map.x / 6, map.y / 8  -- Affects x more than y
		end
	end
end

-- This function is called when scene comes fully on screen
function scene:show( event )

	local phase = event.phase
	if ( phase == "will" ) then
		fx.fadeIn()	-- Fade up from black
		Runtime:addEventListener( "enterFrame", enterFrame )
	elseif ( phase == "did" ) then
		-- Start playing wind sound
		-- For more details on options to play a pre-loaded sound, see the Audio Usage/Functions guide:
		-- https://docs.coronalabs.com/guide/media/audioSystem/index.html
		audio.play( self.sounds.wind, { loops = -1, fadein = 750, channel = 15 } )
	end

end

-- This function is called when scene goes fully off screen
function scene:hide( event )

	local phase = event.phase
	if ( phase == "will" ) then
		audio.fadeOut( { time = 1000 } )
	elseif ( phase == "did" ) then
		Runtime:removeEventListener( "enterFrame", enterFrame )
	end
end

-- This function is called when scene is destroyed
function scene:destroy( event )

	audio.stop()  -- Stop all audio
	for s, v in pairs( self.sounds ) do  -- Release all audio handles
		audio.dispose( v )
		self.sounds[s] = nil
	end
end

scene:addEventListener( "create" )
scene:addEventListener( "show" )
scene:addEventListener( "hide" )
scene:addEventListener( "destroy" )

return scene

