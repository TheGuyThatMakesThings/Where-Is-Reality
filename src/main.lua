-- NOTICE
-- This is a prototype, nothing is final.
-- THIS IS ALSO VERY TRUE FOR THE SPRITES! I KNOW THEY SUCK!



function love.load()
    anim8 = require 'libraries/anim8'

    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]

    player = {}
    player.x = 400
    player.y = 200
    player.speed = 3
    player.spritesheet = love.graphics.newImage('sprites/prototype-sheet.png')

    player.grid = anim8.newGrid( 21, 26, player.spritesheet:getWidth(), player.spritesheet:getHeight() )

    player.animations = {}

    player.animations.right = anim8.newAnimation( player.grid('1-4', 1), 0.2 )

    player.anim = player.animations.right

    love.graphics.setBackgroundColor(4, 2, 5)



end

function love.update(dt)

    if joystick ~= nil then
        if joystick:isGamepadDown("dpleft") then
            player.x = player.x - player.speed
        end
        if joystick:isGamepadDown("dpright") then
            player.x = player.x + player.speed
        end
        if joystick:isGamepadDown("dpup") then
            player.y = player.y - player.speed
        end
        if joystick:isGamepadDown("dpdown") then
            player.y = player.y + player.speed
        end
    end


        -- This code is only allowed to exist on the computer branch. DO NOT let this get on the 3DS-latest branch in anyway at all.
        if love.keyboard.isDown("right") then
            player.x = player.x + speed
        end

        if love.keyboard.isDown("left") then
            player.x = player.x - speed
        end
        if love.keyboard.isDown("down") then
            player.y = player.y + speed
        end

        if love.keyboard.isDown("up") then
            player.y = player.y - speed
        end


        player.anim:update(dt)

    end
end

-- Add screen into the parameters of love.draw for 3DS branch.
-- Code still works fine on computer this way, also saves time.
function love.draw()
    if screen ~= "bottom" then
        player.anim:draw(player.spritesheet, player.x, player.y)
    end
end