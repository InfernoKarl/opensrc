local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InGameFolder = ReplicatedStorage.InGameFolder
local categories = {"Accessory", "Armors", "Items", "Pants", "Shields", "Shirt", "Weapons"}

local function fireRemote(modelName)
    local args = {
        [1] = modelName,
        [2] = 0,
        [3] = 0,
        [4] = 0
    }
    ReplicatedStorage.Remote.LocalItemPick:FireServer(unpack(args))
end

for _, category in ipairs(categories) do
    local categoryFolder = InGameFolder[category]

    for _, model in ipairs(categoryFolder:GetChildren()) do
        local modelName = model.Name
        fireRemote(modelName)
        print(modelName)
        task.wait()
    end
end
