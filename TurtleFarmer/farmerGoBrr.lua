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

local function itemType(iType, amountNeeded)
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





local function getSize()
    if turtle.detectDown() == true then
        turtle.up()
    end
    
    print("Please input one number, fields are square: ")
    local size = tonumber(read())
    if size >= 1 then
        print("The size of the field is square. Creating a " ..size.. " x " ..size.. " field." )
        return size
    elseif size <= 0 then
        print("Cannot be a negative number or 0. Running default size of 9 x 9")     
        return 9
    elseif size == nil then
        print("Input could not be read. Round numbers only and cannot be text. Running default size of 9x9.")
        return 9
    else
        print("Input could not be read. Round numbers only and cannot be text. Running default size of 9x9.")
        return 9 
    end    
end

local function changerWorker(workerType)
    --change the hoe to a miner
    local miner = false
    local hoe = false
    if workerType == 1 then
        itemType("minecraft:diamond_pickaxe", 1)
        turtle.equipRight()
        miner = true
        hoe = false
        return miner
    elseif workerType == 2 then
        --change the miner to a hoe
        itemType("minecraft:diamond_hoe", 1)
        turtle.equipRight()
        miner = false
        hoe = true
        return hoe
    end
end


local function turtlePlower()
    --This function is a bit to figure out how to do the plowing. I'm not reading other's turtle code because 
    --this a learning exercise as much as it's stupid minecraft turtle plowing. 
    --Reading Lua doc, ComputerCraft API, and searching for specific, none minecraft answers.

    --This will be replaced by our fuel check function later. It's for testing.
    if turtle.getFuelLevel() < 50 then
        turtle.refuel()
    end
    --Did not expect this to do what it does...
    --It runs the function from here and returns the value. It makes sense on retrospect, but didn't when I first wrote it.
    --I added it here to get the returned value thinking that I had to run the function first.
    --Actually, it doesn't make sense to me. Is it running the function when the var is created? Okay, thinking about it. It does make sense.
    --I think.

    local inputNum = getSize()
    local fSize = inputNum * inputNum
    local rowCount = 1
    local waterRow = 6
    local placeWater = true
    for i = 1, fSize, 1 do
        if waterRow % 5 + 5  == 0 then
            -- placeWater = false
            -- if placeWater == false then
            --     placeWater = true
                changerWorker(1)
                turtle.down()
                turtle.digDown()
                itemType("minecraft:water_bucket", 1)
                turtle.placeDown()
                turtle.up()
                changerWorker(2)
                waterRow = waterRow + 1
            end

        if i % inputNum == 0  then
           if rowCount == 1 then
                turtle.digDown()
                turtle.turnRight()
                turtle.forward()
                turtle.digDown()
                turtle.turnRight()
                rowCount = 2
                waterRow = waterRow + 1
            elseif rowCount == 2 then
                turtle.digDown()
                turtle.turnLeft()
                turtle.forward()
                turtle.digDown()
                turtle.turnLeft()
                rowCount = 1
                waterRow = waterRow + 1
            --place water center of farm
           end
        else
            turtle.digDown()
            turtle.forward()
        end         
    end
end



turtlePlower()

-- print("Please input size of field:")
-- local fieldSize = read()
-- plowField(fieldSize)
-- print("Does the field need to be cleared? Y or N")
-- local deforest = read()
-- print(deforest)

-- if waterRow % 4 == 0 then
--     turtle.down()
--     turtle.digDown()
--     itemType("minecraft:water_bucket", 1)
--     turtle.placeDown()
--     turtle.up()
