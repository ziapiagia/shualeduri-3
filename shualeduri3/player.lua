Player = Class{}

GRAVITY = 20

function Player:init()
	
	self.image = love.graphics.newImage('snail.png')
	
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
	
	self.y = VIRTUAL_HEIGHT - self.height 
	self.x = VIRTUAL_WIDTH / 2 - self.width / 2
	self.dy = 0
	
end

function Player:collides(target)
	
	return true

end


function Player:update(dt)
	
	
	if love.keyboard.isDown('space') then
		self.dy = -5
	elseif self.dy == -5 then
		self.dy = self.dy + GRAVITY * dt
		
	end
	
	self.y = self.y + self.dy

	

end

function Player:render()
	love.graphics.draw(self.image, self.x, self.y)
end
