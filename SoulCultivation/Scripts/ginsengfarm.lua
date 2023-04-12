local player = game:GetService("Players").LocalPlayer
local Ginseng = game:GetService("Workspace").Areas["Forest Of Dao"].Ginseng
local TweenService = game:GetService("TweenService")

local function teleportAndTrigger()
    wait(3)
    for _, ginsengObject in ipairs(Ginseng:GetChildren()) do
        local proximityPrompt = ginsengObject:FindFirstChild("Harvest")
        if proximityPrompt and proximityPrompt:IsA("ProximityPrompt") and ginsengObject.Transparency == 0 then
            local destinationCFrame = ginsengObject.CFrame
            local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
            local tween = TweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = destinationCFrame})
            
            tween:Play()
            tween.Completed:Wait()
            fireproximityprompt(proximityPrompt)
            wait(3)
        end
    end
end

local FODposition = CFrame.new(2275.35498046875, 76.9999771118164, 1740.618408203125)
local initialTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
local initialTween = TweenService:Create(player.Character.HumanoidRootPart, initialTweenInfo, {CFrame = FODposition})

initialTween:Play()
teleportAndTrigger()
