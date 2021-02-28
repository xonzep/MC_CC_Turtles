--[[
    
Copyright (C) 2021  Jeff 'Xonze' M


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

]]--

--We set these vars to try to keep track of where we are in the world so we can return where we started and drop off stuff or pick up stuff.
local x = 0
local y = 0
local negX= 0
local negY= 0
local dirX = 0
local dirNegX= 0


local function itemType(iType)
    for i = 1, 17, 1 do
        if turtle.getItemDetail() then
            if turtle.getItemDetail().name == iType then 
                break
            elseif i > 16 then
                turtle.select(1)
                print("Item not in Inventory.")
            else
                turtle.select(i)
            end
        elseif i > 16 then
            turtle.select(1)
            print("Item not in Inventory.")
        else
            turtle.select(i)
        end 
    end
    return iType
end


--if we need to flatten the terrain. Needs to have a pickaxe so we call on our child iType. 
--Not sure how two items equip work...but we'll play it safe for now and just switch em.
local function clearBlock(clear, up)
    --change the hoe to a miner
    itemType("minecraft:diamond_pickaxe")
    turtle.equipRight()
    --do the deed
    up = 0
    if up == 1 then
            turtle.up()
        y = y + y
    end

    for i = 1, clear, 1 do
        if turtle.detectDown() == true then
            turtle.digDown()
        elseif turtle.detect() == true then
            turtle.dig()
        end 
    end
    --change the miner to a hoe
    itemType("minecraft:diamond_hoe")
    turtle.equipRight()
end

local function dirFaceRight(rot)
    for i = 1, rot, 1 do
    turtle.turnRight()  
    end
    dirX = dirX + rot
end

local function dirFaceLeft(rot)
    for i = 1, rot, 1 do
    turtle.turnLeft()  
    end
    dirNegX = dirNegX + rot
end


local function moveForward(steps)
    for i = 1, steps, 1 do
        turtle.forward()
    end
    x = x + steps
    clearBlock(steps)
end

local function moveBack(negsteps)
    for i = 1, negsteps, 1 do
        turtle.forward()
    end
    negX = negX + negsteps
        
end

local function moveUp(fly)
    for i = 1, fly, 1 do
        turtle.up()
    end
    y = y + fly
    clearBlock(fly)
end

local function moveDown(drop)
    for i = 1, drop, 1 do
        turtle.down()
    end
    negY = negY + drop
    clearBlock(drop)
end
