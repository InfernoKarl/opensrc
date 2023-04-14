local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")

local function teleportAndTrigger()
   wait(2)
   local divineYangTrees = game:GetService("Workspace").Areas["Demon Pelago"]:GetDescendants()
   for _, object in ipairs(divineYangTrees) do
       if object:IsA("Model") and object.Name == "Divine Yang Tree" then
           local part = object:FindFirstChild("Plant")
           if part then
               local proximityPrompt = part:FindFirstChild("Harvest")
               if proximityPrompt and proximityPrompt:IsA("ProximityPrompt") and part.Transparency == 0 then
                   local destinationCFrame = part.CFrame
                   local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
                   local tween = TweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = destinationCFrame})

                   tween:Play()
                   tween.Completed:Wait()
                   fireproximityprompt(proximityPrompt)
                   wait(3)
               end
           end
       end
   end
end

local DemonPel = CFrame.new(2556.35791, 76.9999771, 3906.94434, -0.841962934, -1.68066574e-08, 0.539535344, -5.80841331e-08, 1, -5.94919882e-08, -0.539535344, -8.14284959e-08, -0.841962934)
local initialTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
local initialTween = TweenService:Create(player.Character.HumanoidRootPart, initialTweenInfo, {CFrame = DemonPel})

initialTween:Play()
teleportAndTrigger()

while true do
    teleportAndTrigger()
    wait(1)
end
