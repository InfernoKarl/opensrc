local ToolName = "Combat" 

local function teleportAndKill(npc)
    local humanoid = npc:FindFirstChildOfClass("Humanoid")
    if humanoid and game.Players.LocalPlayer.Character.Combat then
        local npcTorso = humanoid.Parent:WaitForChild("Torso")
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npcTorso.CFrame * CFrame.new(0, 0, 5)

        while humanoid.Health > 0 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npcTorso.CFrame * CFrame.new(0, 0, 5)
            local ohVector32 = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(2, 0, 0))
            local ohCFrame3 = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
            game:GetService("ReplicatedStorage").RemoteEvents.BladeCombatRemote:FireServer(ohBoolean1, ohVector32, ohCFrame3)
            wait()
        end
    end
end

local function teleportBehindAllNPCs()
    local liveFolder = workspace:FindFirstChild("Live")

    if liveFolder then
        local npcs = liveFolder:GetChildren()

        for _, npc in ipairs(npcs) do
            teleportAndKill(npc)
        end
    end
end

teleportBehindAllNPCs()

local player = game.Players.LocalPlayer
player.CharacterAdded:Connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(game.Players.LocalPlayer.Backpack.Combat)
    teleportBehindAllNPCs()
end)
