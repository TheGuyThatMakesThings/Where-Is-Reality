-- NOTICE
-- This is a very basic build of the game that doesn't even contain sprites, 



function love.load()
    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]

-- This detector should probably be removed at some point, I have to find another way to get the game working on PC and 3DS, if I can't do that then emulators will have to do for some people.
    if love._potion_version == nil then
        platform = computer
    end
    if love._potion_version ~= nil then
        platform = console
    end
    player = {}
    player.x = 400
    player.y = 200
--    player.xv = 0
--   player.yv = 0
-- These values were removed because it was not the intended movement style for the game.
    player.speed = 3
end

function love.update(dt)
--    player.x = player.x + player.xv
--    player.y = player.y + player.yv
 --   if player.xv > 0 then
 --       player.xv = player.xv - 0.06
 --   end
  --  if player.xv < 0 then
  --      player.xv = player.xv + 0.06
   -- end
   -- if player.yv > 0 then
   --     player.yv = player.yv - 0.06
   -- end
  --  if player.yv < 0 then
   --     player.yv = player.yv + 0.06
  --  end
-- Don't criticize me on the weirdly positioned comments, they are not my proudest work.

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

    end
end


function love.draw()
    if screen ~= "bottom" then
        love.graphics.circle("fill", player.x, player.y, 30)
end
end