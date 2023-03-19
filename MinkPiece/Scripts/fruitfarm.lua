getgenv().Fruits = false

while Fruits do task.wait()

for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v:FindFirstChild("Stem") and v:FindFirstChild("Handle") then
local Time = 1
local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = v.Handle.CFrame})


tween:Play()
tween.Completed:Wait(E)
end
end
end
