-- NOTICE
-- This is a prototype, nothing is final.



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


end

-- Make sure to add screen paramater to love.draw otherwise it renders on both screens.
function love.draw(screen)
    if screen ~= "bottom" then
        love.graphics.circle("fill", player.x, player.y, 30)
    end
end