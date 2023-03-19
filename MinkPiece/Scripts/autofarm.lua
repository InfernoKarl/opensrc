local ohNumber2 = 1
local ohString3 = "Melee" -- If you want to do it with Sword, then change this to Sword and equip your sword

local NPC = game.Workspace['NPCs'].Normal
local Working = true

while Working do
wait()
for _,v in ipairs(NPC:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") then
    local ohInstance1 = v
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(-2,0,0)
game:GetService("ReplicatedStorage").Remotes.DmgEvent:FireServer(ohInstance1, ohNumber2, ohString3)

end
end
end
