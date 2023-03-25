local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/StepBroFurious/Script/main/HydraHubUi.lua'))()
local Window = UILib.new("RPG Elevator", game.Players.LocalPlayer.UserId, "Cool Person")
local Category1 = Window:Category("Main", "http://www.roblox.com/asset/?id=8395621517")
local SubButton1 = Category1:Button("Misc", "http://www.roblox.com/asset/?id=8395747586")
game:GetService("Players").LocalPlayer.PlayerGui.Inventory.PlayerStat.LocalScript:Destroy()
game:GetService("Players").LocalPlayer.playerstat.Level.Value = 100

local Section1 = SubButton1:Section("Misc", "Left")

Section1:Keybind({
    Title = "Infinite Stats",
    Description = "",
    Default = Enum.KeyCode.T
}, function()
    local toggle = false
    local player = game:GetService("Players").LocalPlayer
    local ohInstance1 = player.Items["A Beginner's Necklace"]

    local function toggleAccessory()
        while toggle do
            game:GetService("ReplicatedStorage").Remote.AccessoryPuEvent:FireServer(ohInstance1)
            task.wait() 
        end
    end

    local function keyPressed(input)
        if input.KeyCode == Default then
            toggle = not toggle
            if toggle then
                toggleAccessory()
            end
        end
    end

    game:GetService("UserInputService").InputBegan:Connect(keyPressed)
end)

Section1:Button({
    Title = "Give All Items",
    Description = "Give player all items in the game",
    Default = "",
}, function(value)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local InGameFolder = ReplicatedStorage.InGameFolder
    local categories = {"Accessory", "Armors", "Items", "Pants", "Shields", "Shirt", "Weapons"}
    game:GetService("Players").LocalPlayer.playerstat.Level.Value = 100

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
end)
