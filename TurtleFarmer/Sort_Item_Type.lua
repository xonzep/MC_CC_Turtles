--[[
    
Copyright (C) 2021  Jeff 'Xonze' M


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

]]--

-- local function itemReturn(iType)
--    local iType = iType
--     if turtle.getItemDetail().name == iType then
--         throwBack(18)
--     elseif not turtle.getItemDetail().name == iType then
--             for i = 1, 16, 1 do
--                 turtle.select(i)   
--             end
        

--     end        
-- end

-- local function testItemType(iType)
--     print(iType)
--     print(turtle.getItemDetail().name)
-- end
-- turtle.select(1)
-- testItemType("minecraft:coal")
-- turtle.select(3)
-- testItemType("minecraft:coal")

--Figured out our problem. For some odd reason... I guess because of the version of Minecraft I'm running, Bonemeal isn't seen as minecraft:bonemeal
--But as minecraft:dye. Probably should have noticed that sooner, but I'm an idiot so...

local function itemSort ()

    for i = 1, 16, 1 do
        turtle.select(i)
    end
    sleep(2)
    turtle.select(1)
end

--This actually freaking works!
--Now we can check what we have selected and then return most of the items so we only carry what we need.
--But need to code a break somewhere otherwise it loops forever if item isn't there. inv = 16 break should work.
local function testItemType(iType)
    local inv = 1
    while true do
        if turtle.getItemDetail() then
            if turtle.getItemDetail().name == iType then
                print(turtle.getItemDetail().name)
                break
            else
                inv = inv + 1
                turtle.select(inv)
            end
        elseif inv == 16 then 
                inv = 1
                turtle.select (inv)
                print("Items aren't in inventory")
                break
        else
            inv = inv + 1
            turtle.select(inv)
            
        end
    end
end
    


testItemType("minecraft:water_bucket")
