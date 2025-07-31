-- Hey!
-- This is the ADVANCED RPG BASE branch, you may be in the wrong place!
-- For 3DS, go to 3DS-latest
-- For Computer, go to computer-latest



function love.load()
    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]

    player = {}
    player.x = 400
    player.y = 200
    player.speed = 3
end

function love.update(dt)


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



    -- This code has been commented out because the game literally does not function on LOVEPOTION with this existing.
--[[    if platform == computer then

        -- Begin basic movement
        if love.keyboard.isDown("right") then
            player.xv = player.xv + 0.12
        end

        if love.keyboard.isDown("left") then
            player.xv = player.xv - 0.12
        end
        if love.keyboard.isDown("down") then
            player.yv = player.yv + 0.12
        end

        if love.keyboard.isDown("up") then
            player.yv = player.yv - 0.12
        end

    end]]
end


function love.draw(screen)
    if screen ~= "bottom" then
        love.graphics.circle("fill", player.x, player.y, 30)
end
end
