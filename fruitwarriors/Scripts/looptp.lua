local player = game:GetService("Players").LocalPlayer

local mobFolder = game.Workspace.Mobs

if not mobModel then
    print("Could not find the mob")
end

while true do
    mobModel = mobFolder:FindFirstChild("Bandit Leader (Level 15)") -- Change to whatever you wanna teleport to, but for beginners the Bandit Leader is a good one to teleport to with the autoclicker and force combat scripts
    player.Character.HumanoidRootPart.CFrame = mobModel.PrimaryPart.CFrame
    wait(5)
end
