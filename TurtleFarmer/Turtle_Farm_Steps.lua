--[[
    
Copyright (C) 2021  Jeff 'Xonze' M


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

]]--

--day by day
--We wrote an entire program and it works..but it doesn't. So, we're gonna stop being dumb and do this step by step 
--and see where we break and it doesn't work as expected.

--We use these a couple of times so set the var here. Don't think this is a good idea...but...
local successI, data = turtle.inspectDown()
local successINV, dataInv = turtle.getItemDetail()



--Make sure we're facing the right way. There could be an issue here... I just don't know what. We learned that we can't pass a number to 
--have it do more than one thing at a time. If we want it to turn or move we have to call it each time.
local function faceForward()
    if turtle.detect() then
        turtle.turnRight()
        turtle.turnRight()
    end
end


--We get fuel from chest.
local function getFuel()
    if successI and data.name == "minecraft:chest" then
        turtle.suckDown(8)
        local success = turtle.refuel()
            if not success and turtle.getFuelLevel() > 300 then 
                print(turtle.getFuelLevel())
        end
    end
end

--We learned that the turtle doesn't count the block that it is on when moving. There is a better way to do this. I don't know what it is yet.
local function toPos()
   for i = 1, 4, 1 do
    turtle.forward()
   end
   turtle.turnLeft()
   for i = 1, 3, 1 do
    turtle.forward()
   end
   turtle.turnRight()

end

local function plowPlant(bCount)
    local bCount = bCount
    for i = 1, bCount, 1 do
        turtle.digDown()
        turtle.forward()
    end
end

local function endRowTurnRight()
    turtle.turnRight()
    turtle.digDown()
    turtle.forward()
    turtle.turnRight()
end

local function endRowTurnLeft()
    turtle.turnLeft()
    turtle.digDown()
    turtle.forward()
    turtle.turnLeft()
end


faceForward()
getFuel()
toPos()

for i = 1, 4, 1 do
    plowPlant(8)
    endRowTurnRight()
    plowPlant(8)
    endRowTurnLeft()
end
