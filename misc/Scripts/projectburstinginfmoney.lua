getgenv().Chest = true
while Chest do task.wait()

for _,v in pairs(game:GetService("Workspace").Map.Chests:GetDescendants()) do
    if v.Name == "Chest" and v:FindFirstChild("ProximityPrompt") then
        local Time = 2
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
        fireproximityprompt(v:FindFirstChild("ProximityPrompt"))
        end
    end
end
