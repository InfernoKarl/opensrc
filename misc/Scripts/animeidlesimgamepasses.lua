local player = game.Players.LocalPlayer
local gamepassesFolder = player:FindFirstChild("Gamepasses")

if gamepassesFolder then
    for _, child in ipairs(gamepassesFolder:GetChildren()) do
        if child:IsA("BoolValue") then
            child.Value = true
        end
    end
end
