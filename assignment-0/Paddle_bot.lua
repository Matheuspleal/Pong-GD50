--[[
    v.0.1.0
    Here we will implement a new class called Paddle-BOT.lua, in wich we'll specify certain parameters
    for the AI to be able to reflect the ball.
    We'll make a test version called v.0.0.1, 
    where the Player 2 is always the AI driven Paddle and it has no speed limits
    Here at version 0.1.0 we decided to limit the AI's maximum speed
]]

--Firstly, we'll try to implement a perfect AI (Will always deflect the ball correctly)
--We'll implement a solo game for now. (Player vs AI)

Paddle_bot = Class{}

--Here we create our AI driven paddle parameters

function Paddle_bot:init(x,y,width,height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 0
end

function Paddle_bot:update(dt)
    --Here we will limit the paddle's maximum speed
    if self.dy > 200 then
        self.dy = math.min(200, self.dy)
    end
    --Here we will keep track of the Y movement on the ball and make the paddle react to it
    self.y = ball.y
    --here the boundaries will be applied. for the AI to only be able to move on the play screen
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    else
        self.y = math.min(VIRTUAL_HEIGHT-self.height, self.y + self.dy * dt)
    end
end

--Here we will print our rectangular AI paddle to the screen

function Paddle_bot:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end