--[[
    
Copyright (C) 2021  Jeff 'Xonze' M


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

]]--

local function neededItemAmount (count)
    --Guess I was smart enough. This works. Gets the current slot, checks how much of an item is there and 
    --if it's more than what we want it figures out the difference and drops it back. Now I gotta put it into the main program... yay
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

neededItemAmount(25)