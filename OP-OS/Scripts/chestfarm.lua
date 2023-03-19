getgenv().Chest = true

while Chest do 
    local success, error = pcall(function()
        for _,v in pairs(game:GetService("Workspace").Chests:GetDescendants()) do
            if v.Name == "Gold Chest" and v.CanCollide == true then
                local Time = 0.5
                local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = v.CFrame})

                tween:Play()
                tween.Completed:Wait(Time)
                fireclickdetector(v:FindFirstChild("Click"))
            end
        end
    end)
    if not success then
        warn("An error occurred: " .. error)
    end
    task.wait()
end
