StartState = Class{__includes = BaseState}

function StartState:render()
	love.graphics.printf(
		'press enter to start',
		0,
		VIRTUAL_HEIGHT / 2 - 16,
		VIRTUAL_WIDTH,
		'center')
	
	if love.keyboard.isDown('return') then
		stateMachine:change('play')
	end
end

