local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

local function checkTools()
    while true do
        local foundToolWithoutNumber = false
        
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local toolName = tool.Name
                local hasNumber = false

                for i = 0, 9 do
                    if string.find(toolName, tostring(i)) then
                        hasNumber = true
                        break
                    end
                end

                if not hasNumber then
                    player.Character.Humanoid:EquipTool(tool)
                    tool:Activate()
                    wait(0.1)
                    tool:Deactivate()
                    wait()
                    foundToolWithoutNumber = true
                    player.Character.Humanoid:UnequipTools(tool)
                    break
                end
            end
        end
        
        if not foundToolWithoutNumber then
            wait()
        end
    end
end

spawn(checkTools)
