--[[
    
Copyright (C) 2021  Jeff 'Xonze' M


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

]]--

local function checkFuel()
    local minFuel = 50
    if turtle.getFuelLevel() < minFuel then
        turtle.refuel()
    end
end

local function isBlock()
    if turtle.detect() == true then
        turtle.dig()
        turtle.forward()
    elseif turtle.detect() == false then
        turtle.forward()
    end
end    

local function digDown()
    if turtle.detect() == true then
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
    elseif turtle.detect() == false then
        turtle.digDown()
        turtle.down()
        
        
    end
end

for i = 1, 100, 1 do
    digDown()
end
