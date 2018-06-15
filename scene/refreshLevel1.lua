local composer = require( "composer" )
 
local scene = composer.newScene()



function scene:show( event )

	local phase = event.phase
	local options = { params = event.params }
	if ( phase == "will" ) then
		composer.removeScene( "scene.level1Sub" )
		composer.gotoScene( "scene.levelSelectScene", options )
    	composer.gotoScene( "scene.level1" )
	elseif ( phase == "did" ) then
		
		
	end
end

scene:addEventListener( "show", scene )

return scene