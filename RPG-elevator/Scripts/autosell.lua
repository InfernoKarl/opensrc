local player = game:GetService("Players").LocalPlayer
local itemsFolder = player:FindFirstChild("Items")

if itemsFolder then
    local pawnShopGui = player.PlayerGui.PawnShop.Frame.ScrollingFrame.UIGridLayout.Des.RemoteEvent
    local ohNumber3 = 1
    local ohNumber4 = 1

    for _, tool in ipairs(itemsFolder:GetChildren()) do
        if (tool:IsA("Tool") or tool:IsA("Model")) then
            local equipBool = tool:FindFirstChild("Equip")

            if not equipBool or (equipBool:IsA("BoolValue") and not equipBool.Value) then
                local ohInstance1 = tool
                local ohInstance2 = player
                pawnShopGui:FireServer(ohInstance1, ohInstance2, ohNumber3, ohNumber4)
            end
        end
    end
else
    warn("Items folder not found in the LocalPlayer")
end
