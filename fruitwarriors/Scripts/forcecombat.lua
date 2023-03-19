local player = game:GetService("Players").LocalPlayer

local function hasCombatToolEquipped()
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool.Name == "Combat" and tool:IsA("Tool") then
            return true
        end
    end
    return false
end

while true do
    if not hasCombatToolEquipped() then
        local combatTool = player.Backpack:FindFirstChild("Combat")
        if combatTool then
            player.Character.Humanoid:EquipTool(combatTool)
        end
    end
    wait(0.1) 
end
