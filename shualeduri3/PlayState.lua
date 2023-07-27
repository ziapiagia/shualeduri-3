PlayState = Class{__includes = BaseState}
local background = love.graphics.newImage('background.png')
local backgroundScroll = 0

local BACKGROUND_SCROLL_SPEED = 50
local LOOPING_POINT = 248.5

function PlayState:init()
	self.player = Player()
end

function PlayState:update(dt)
	if love.keyboard.isDown('right') then
		backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % LOOPING_POINT
	elseif love.keyboard.isDown('left') then
		backgroundScroll = (backgroundScroll - BACKGROUND_SCROLL_SPEED * dt) % LOOPING_POINT
	end
end

function PlayState:render()
	love.graphics.draw(background, -backgroundScroll, 0)
	self.player:render()
end

