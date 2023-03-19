local function bringCrates()
    local Crate = game.Workspace:GetChildren()
    local Plr = game.Players.LocalPlayer.Character.HumanoidRootPart
    for i, v in pairs(Crate) do
        if v.Name == "Clover" then
            v.CFrame = Plr.CFrame
        elseif v.Name == "XP" then
            v.CFrame = Plr.CFrame
        elseif v.Name == "Gem" then
            v.CFrame = Plr.CFrame
        elseif v.Name == "Basic" then
            v.CFrame = Plr.CFrame
        elseif v.Name == "Money" then
            v.CFrame = Plr.CFrame
        end
    end
end

while true do
    bringCrates()
    wait(0.1)
end
