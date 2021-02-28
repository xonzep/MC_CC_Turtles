--[[
    
Copyright (C) 2021  Jeff 'Xonze' M


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

]]--

--This went easier than I expected. Works perfectly. We get the item type and amount we want after we suck down from the chest.

local function neededItemAmount (count)
    local selectedSlot = turtle.getSelectedSlot()
    local invCount = turtle.getItemCount(selectedSlot)
    local aValue = 1

    if invCount > count then
        aValue = math.abs(invCount - count)
        turtle.dropDown(aValue)
    else
        print("Need more of Item")
    end    
end





--We can do this with a forloop I think...
--We go for 17 because otherwise it won't check the last inventory slot. But we can't call over 17 because it'd be out of range which is what the elseif is for.
--Might be a better way of doing this, but for now... it works.
local function ItemType(iType, amountNeeded)
    for i = 1, 17, 1 do
        if turtle.getItemDetail() then
            if turtle.getItemDetail().name == iType then
                neededItemAmount(amountNeeded)
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
end

ItemType("minecraft:wheat_seeds", 32)