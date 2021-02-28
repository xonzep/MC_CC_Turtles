--[[
    
Copyright (C) 2021  Jeff 'Xonze' M


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

]]--

--This is probably broken as hell. No... it is broken. But gotta start somewhere and I'm sure I've complicated things. Oh well. Farmer Turtle Away!
--This is just the planting. Have to figure out the harvesting. I just learned how to pass vars in a function and know zero LUA.
--With that background... what did you expect?

--We try to keep track of where the turtle is so it can return to it's beginning. We do a very poor job of this.
local curX = 0
local curZ = 0

local conner = 7

--We use these a couple of times so set the var here. Don't think this is a good idea...but...
local successI, data = turtle.inspectDown()
local successINV, dataInv = turtle.getItemDetail()

--Return from whence we came. I don't think I'm smart enough for this.
local function returnToZero()
    turtle.turnRight(2)
    repeat
        turtle.forward()
        curX = curX - 1
    until curX == 0
    turtle.turnLeft()
    sleep (5)
    repeat
        turtle.forward()
        curZ = curZ - 1
    until curZ == 0
end

--function to get fuel from chest. We probably need to code a failure state here, maybe go back to 0, 0  if fuel level doesn't go up?
local function getFuel()
        if successI and data.name == "minecraft:chest" then
            turtle.suckDown(8)
            local success = turtle.refuel()
                if not success and turtle.getFuelLevel() > 300 then 
                    print(turtle.getFuelLevel())
                    returnToZero()
            end
        end
end

--function to move into postion to start.
local function movePos(x, z)
    --Make sure we're facing the right way. There could be an issu here... I just don't know what.
    if turtle.detect() then
        turtle.turnRight(2)
    end
    turtle.forward(z)
    curZ = curZ + z
    turtle.turnRight()
    turtle.forward(x)
    curX = curX + x
    turtle.turnLeft()
    sleep(20)
end

--function to FARM
local function plowAndPlant()
    for i = 1, 12, 1 do
        if turtle.detectDown() and data.name == "minecraft:dirt" then
            turtle.digDown()
            --Selecting bonemeal and we check to make sure it's bone meal. If not, we return to 0, 0
            turtle.select(2)
            if successINV and dataInv.name == "minecraft:bonemeal" then
                turtle.placeDown()
            else
                print("No bonemeal")
            end

            --Selecting Seed and we check to make sure it's wheat seeds. If not we return to 0, 0 Something for the furture kids
            turtle.select(3)
            if dataInv.name() == "minecraft:wheat_seeds" then
                turtle.placeDown()
            else
                print("No seed")
            end
            turtle.forward()
        end
    end
    curZ = curZ + 12

end

local function endRowTurnRight()
    turtle.turnRight()
    turtle.forward()
    curX = curX + 1
    turtle.turnRight()
end

local function endRowTurnLeft()
    turtle.turnLeft()
    turtle.forward()
    curX = curX + 1
    turtle.turnLeft()
end

getFuel()
movePos(4, 1)

for i = 1, 4, 1 do
    plowAndPlant()
    endRowTurnRight()
    plowAndPlant()
    endRowTurnLeft()
end


