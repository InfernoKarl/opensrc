local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")

local function teleportAndTrigger()
   wait(2)
   local lotusFlowers = game:GetService("Workspace").Areas["Green Pelago"]:GetDescendants()
   for _, object in ipairs(lotusFlowers) do
       if object:IsA("Part") and object.Name == "Lotus" then
           local part = object
           if part then
               local proximityPrompt = part:FindFirstChild("Harvest")
               if proximityPrompt and proximityPrompt:IsA("ProximityPrompt") and proximityPrompt.Enabled == true then
                   local destinationCFrame = part.CFrame
                   local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
                   local tween = TweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = destinationCFrame * CFrame.new(0, 2, 0)})

                   tween:Play()
                   tween.Completed:Wait()
                   fireproximityprompt(proximityPrompt)
                   wait(3)
               end
           end
       end
   end
end

local GPPos = CFrame.new(3112.27905, 72.9999771, 3720.5332, -0.440835655, 5.43041558e-08, 0.897587836, -1.72372037e-08, 1, -6.89658748e-08, -0.897587836, -4.58745184e-08, -0.440835655)
local initialTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
local initialTween = TweenService:Create(player.Character.HumanoidRootPart, initialTweenInfo, {CFrame = GPPos})

initialTween:Play()
initialTween.Completed:Wait()

while true do
    teleportAndTrigger()
    wait(1)
end
