local toggle = false
local player = game:GetService("Players").LocalPlayer
local ohInstance1 = player.Items["A Beginner's Necklace"] -- Modify with whatever accessory you want to spam equip instead (if you already got rid of the starter necklace)
game:GetService("Players").LocalPlayer.playerstat.Level.Value = 100
game:GetService("Players").LocalPlayer.PlayerGui.Inventory.PlayerStat.LocalScript:Destroy()

local function toggleAccessory()
    while toggle do
        game:GetService("ReplicatedStorage").Remote.AccessoryPuEvent:FireServer(ohInstance1)
        task.wait() 
    end
end

local function keyPressed(input)
    if input.KeyCode == Enum.KeyCode.T then
        toggle = not toggle
        if toggle then
            toggleAccessory()
        end
    end
end

game:GetService("UserInputService").InputBegan:Connect(keyPressed)
