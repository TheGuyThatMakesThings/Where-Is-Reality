-- NOTICE
-- This is a prototype, nothing is final.
-- THIS IS ALSO VERY TRUE FOR THE SPRITES! I KNOW THEY SUCK!



function love.load()
    camera = require 'libraries.camera'
    cam = camera()


    anim8 = require 'libraries.anim8'
    sti = require 'libraries.sti'
    gameMap = sti('maps/testmap.lua')


    love.graphics.setDefaultFilter("nearest", "nearest")

    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]

    player = {}
    player.x = 400
    player.y = 200
    player.speed = 300
    player.spritesheet = love.graphics.newImage('sprites/prototype-sheet.png')

    player.grid = anim8.newGrid( 21, 28, 128, 128 )

    player.animations = {}

    player.animations.right = anim8.newAnimation( player.grid('1-2', 1), 0.2 )
    player.animations.left = anim8.newAnimation( player.grid('1-2', 3), 0.2 )
    player.animations.down = anim8.newAnimation( player.grid('1-2', 2), 0.2 )
    player.animations.up = anim8.newAnimation( player.grid('1-2', 4), 0.2 )

    player.anim = player.animations.right
    player.idling = true
    player.collider = world:newBSGRectangleCollider(400, 250, 50, 100, 10)
    player.collider:setFixedRotation(true)


--
--    walls = {}
--    if gameMap.layers["Walls"] then
--        for i, obj in pairs(gameMap.layers["Walls"].objects) do
  --          local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
 --           wall:setType('static')
 --           table.insert(walls, wall)
--        end
--    end




    love.graphics.setBackgroundColor(4, 2, 5)




end

function love.update(dt)
    local idling = true
    local vx = 0
    local vy = 0

    if joystick ~= nil then
        if joystick:isGamepadDown("dpleft") then
            player.x = player.x - player.speed
            player.anim = player.animations.left
            idling = false
        end
        if joystick:isGamepadDown("dpright") then
            player.x = player.x + player.speed
            player.anim = player.animations.right
            idling = false
        end
        if joystick:isGamepadDown("dpup") then
            player.y = player.y - player.speed
            player.anim = player.animations.up
            idling = false
        end
        if joystick:isGamepadDown("dpdown") then
            player.y = player.y + player.speed
            player.anim = player.animations.down
            idling = false
        end
    end


        -- This code is only allowed to exist on the computer branch. DO NOT let this get on the 3DS-latest branch in anyway at all.
        if love.keyboard.isDown("right") then
            player.x = player.x + player.speed
            player.anim = player.animations.right
            idling = false
        end

        if love.keyboard.isDown("left") then
            player.x = player.x - player.speed
            player.anim = player.animations.left
            idling = false
        end
        if love.keyboard.isDown("down") then
            player.y = player.y - player.speed
            player.anim = player.animations.down
            idling = false
        end

        if love.keyboard.isDown("up") then
            player.y = player.y + player.speed
            player.anim = player.animations.up
            idling = false
        end


        if idling == true then
            player.anim:gotoFrame(1)
        end




        player.anim:update(dt)

        cam:lookAt(player.x, player.y)

    
end

-- Add screen into the parameters of love.draw for 3DS branch.
-- Code still works fine on computer this way, also saves time.
function love.draw(screen)
    if screen ~= "bottom" then
        cam:attach()
            gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
            player.anim:draw(player.spritesheet, player.x, player.y, nil, 6, nil, 10, 12)
        cam:detach()
    end
end
