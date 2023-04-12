-- Yin Fruit
while wait(1) do

local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")

local function teleportAndTrigger()
    wait(2)
    local divineYangTrees = game:GetService("Workspace").Areas["White Pelago"]:GetDescendants()
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

local WhitePel = CFrame.new(2254.6709, 76.9999771, 3722.33252, 0.251469553, -1.71716756e-08, 0.967865229, 1.16332664e-07, 1, -1.24836044e-08, -0.967865229, 1.15733584e-07, 0.251469553)
local initialTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
local initialTween = TweenService:Create(player.Character.HumanoidRootPart, initialTweenInfo, {CFrame = WhitePel})

initialTween:Play()
teleportAndTrigger()

end
