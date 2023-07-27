push = require 'push'
Class = require 'class'

require 'Player'

require 'StateMachine'

require 'BaseState'
require 'StartState'
require 'PlayState'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288



function love.load()

	love.graphics.setDefaultFilter('nearest', 'nearest')

	
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true
	})
	
	stateMachine =  StateMachine {
		['start'] = function() return StartState() end,
		['play'] = function() return PlayState() end
	}
	
	stateMachine:change('start')
	
	font = love.graphics.newFont('font.ttf', 16)
	love.graphics.setFont(font)
	
	love.keyboard.keysPressed = {}


end

function love.resize(width, height)
	push:resize(width, height)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
	
end

function love.keyboard.wasPressed(key)
	return love.keyboard.keysPressed[key]
end



function love.update(dt)
	
	stateMachine:update(dt)
	
end

function love.draw()
	push:start()
	
	stateMachine:render()
	
	push:finish()
end
