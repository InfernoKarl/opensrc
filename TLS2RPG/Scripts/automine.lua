while wait() do

for _,v in pairs(workspace["Parts/Scenary/Terrain"]:GetChildren()) do
    if v:IsA"Model" then
        if v.Name == "Ore" then
            if v.OreMessage.CanMine.Value == true then
        game:GetService"Players".LocalPlayer.Character:FindFirstChild"HumanoidRootPart".CFrame = v.OreMessage.CFrame
    end
end
end
end
end
