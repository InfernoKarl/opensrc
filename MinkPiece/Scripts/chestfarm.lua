getgenv().Chest = true
while Chest do task.wait()

for _,v in pairs(game:GetService("Workspace").Chests:GetDescendants()) do
    if v.Name == "Chest" and v:FindFirstChild("TouchPart") then
local Time = 1
local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = v.TouchPart.CFrame})


tween:Play()
tween.Completed:Wait(E)
end
end
end
