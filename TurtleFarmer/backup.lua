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
                if inv == 16 then
                    print("Items aren't in inventory.")
                    turtle.select(1)
                    break
                end
                inv = inv + 1
                turtle.select(inv)
            end
        else
            inv = inv + 1
            turtle.select(inv)
            if inv == 16 then
                inv = 1
                turtle.select (inv)
                print("Items aren't in inventory")
                break
            end
        end
    end
end    
 
 
testItemType("minecraft:water_bucket")



-- local function testItemType(iType, amountNeeded)
--     local inv = 1
--     while true do
--         if turtle.getItemDetail() then
--             if turtle.getItemDetail().name == iType then
--                 neededItemAmount(amountNeeded)
--                 break
--             else
--                 inv = inv + 1
--                 turtle.select(inv)
--             end
--         elseif inv == 16 then 
--                 inv = 1
--                 turtle.select (inv)
--                 print("Items aren't in inventory")
--                 break
--         else
--             inv = inv + 1
--             turtle.select(inv)
            
--         end
--     end
-- end



local function plowField()
    if turtle.detectDown() == true then
        turtle.up()
    end

    while true do
        print("Please input size of field:")
        local size = read()
        if size == -1 or 0 then
            print("Cannot be a negative number or 0")
            break      
        else
            print("The size of the field is square. Creating a " + size + " x " + size + " field." )
            break
        end
    
        
    end
   
end

local function figureOutTheSize()
    --This function is a bit to figure out how to do the plowing. I'm not reading other's turtle code because 
    --this a learning exercise as much as it's stupid minecraft turtle plowing.
    if turtle.getFuelLevel() < 50 then
        turtle.refuel()
    end

    local inputNum = 9
    local fSize = inputNum * inputNum
    local rowCount = 1
    for i = 1, fSize, 1 do
        if i % 9 == 0  then
           if rowCount == 1 then
                turtle.turnRight()
                turtle.forward()
                turtle.digDown()
                turtle.turnRight()
                rowCount = 2
            elseif rowCount == 2 then
                turtle.turnLeft()
                turtle.forward()
                turtle.digDown()
                turtle.turnLeft()
                rowCount = 1
           end
        else
            turtle.forward()
            turtle.digDown() 
        end  
    end
end


figureOutTheSize()

-- print("Please input size of field:")
-- local fieldSize = read()
-- plowField(fieldSize)
-- print("Does the field need to be cleared? Y or N")
-- local deforest = read()
-- print(deforest)


