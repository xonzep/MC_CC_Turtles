--[[
    
Copyright (C) 2021  Jeff 'Xonze' M


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

]]--

--These vars again. Still not sure this is the best way to do it.
local successI, data = turtle.inspectDown()




-- local function throwBack (count)
--     --There is a better way, just not smart enough to figure it out. But this loops until we have the count or less in our inv. This causes issues
--     --I don't know how to get it to give me the exact number I want.
    
--     end
-- end


--This has to run before refuel() or all our coal will be gone.
local function getItemChest()
    --First item in chest should be Coal or fuel. We pull fuel first. After that we pull the rest of the items from the chest (seeds).
    --Then we remove what we don't need and put it back in the chest. This is kind of round about...but all I got.
    if successI and data.name == "minecraft:chest" then
        turtle.suckDown()
        turtle.suckDown()
    end
    
end

local function coalReturn ()
    turtle.select(1)
    if turtle.getItemDetail().name == "minecraft:coal" then
        
    end
end

local function testItemType(iType)
    local inv = 1
    while true do
        if turtle.getItemDetail() then
            if turtle.getItemDetail().name == iType then
                
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

getItemChest()