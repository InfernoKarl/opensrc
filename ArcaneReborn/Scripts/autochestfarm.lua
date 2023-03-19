local modelName = "Chest"

-- Define the maximum number of search iterations to prevent infinite loops
local maxSearchIterations = 100

-- Define the maximum number of tween iterations
local maxTweenIterations = 100

-- Define the tween duration
local tweenDuration = 5

local function findModelByName(parent, name)
    for _, child in ipairs(parent:GetChildren()) do
        if child.Name == name then
            return child
        else
            local foundChild = findModelByName(child, name)
            if foundChild then
                return foundChild
            end
        end
    end
    return nil
end

local function tweenToModel(model)
    if model then
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            local rootPart = humanoid.RootPart
            if rootPart then
                local distance = (rootPart.Position - model.Top.Position).Magnitude
                local tweenInfo = TweenInfo.new(tweenDuration, Enum.EasingStyle.Quad)
                local tween = game:GetService("TweenService"):Create(rootPart, tweenInfo, {CFrame = model.Top.CFrame})
                tween:Play()
                tween.Completed:Wait()
            else
                error("RootPart not found on player's character")
            end
        else
            error("Humanoid not found on player's character")
        end
    else
        error("Model not found")
    end
end

local searchIterations = 0
local folder = nil
while not folder and searchIterations < maxSearchIterations do
    for _, child in ipairs(game.Workspace:GetChildren()) do
        if child:IsA("Folder") then
            local chestModel = findModelByName(child, modelName)
            if chestModel then
                folder = child
                break
            end
        end
    end
    if not folder then
        wait(1) -- Wait for 1 second before searching again
    end
    searchIterations = searchIterations + 1
end

if folder then
    while true do
        local closestChest = nil
        local closestDistance = math.huge
        for _, chestModel in ipairs(folder:GetDescendants()) do
            if chestModel.Name == modelName and chestModel:FindFirstChild("Opened").Value == false then
                local distance = (game.Players.LocalPlayer.Character.Humanoid.RootPart.Position - chestModel.Top.Position).Magnitude
                if distance < closestDistance then
                    closestChest = chestModel
                    closestDistance = distance
                end
            end
        end
        if closestChest then
            local success, err = pcall(tweenToModel, closestChest)
            if not success then
                warn("Failed to tween to model: " .. err)
            end
        end
        wait(1) -- Wait for 1 second before searching again
    end
else
    error("Folder not found")
end
