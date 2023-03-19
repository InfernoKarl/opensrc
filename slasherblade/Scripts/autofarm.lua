-- this one is just killaura + tp to mob + auto challenge
local roomFolder = game.Workspace.Room
local challengeFolder = game.Workspace.Challenge
local remote = game:GetService("ReplicatedStorage").Remote.Event.Fight["[C-S]TakeDamage"]
local killaurafarm = true
local player = game.Players.LocalPlayer

local function click(a)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
end

player.PlayerGui.HUD.Right.Show.Frame["\233\135\141\231\148\159"].Button.Red:GetPropertyChangedSignal("Visible"):Connect(function()
    if player.PlayerGui.HUD.Right.Show.Frame["\233\135\141\231\148\159"].Button.Red then
        click(player.PlayerGui.Main.Left.AutoAFK.Bg)
        player.Character.Humanoid.Health = 0
        wait(3)
        firesignal(player.PlayerGui.HUD.Right.Show.Frame["\233\135\141\231\148\159"].Button.MouseButton1Click)
        wait(2)
        click(player.PlayerGui.Main.Rank.Info.Button.Challenge.Button)
        click(player.PlayerGui.Main.Left.AutoAFK.Bg)
    end
end)

local function killaura()
    local localPlayer = game.Players.LocalPlayer
    local playerFound = false
    for _, folder in pairs(roomFolder:GetChildren()) do
        local playersFolder = folder:FindFirstChild("Players")
        if playersFolder then
            local playerValue = playersFolder:FindFirstChild(localPlayer.Name)
            if playerValue then
                playerFound = true
                local mobFolder = folder:FindFirstChild("Mob")
                if mobFolder then
                    for _, mob in pairs(mobFolder:GetChildren()) do
                        local ohInstance = mob.Humanoid
                        pcall(function()
                            localPlayer.Character.PrimaryPart.CFrame = ohInstance.Parent.PrimaryPart.CFrame
                            remote:FireServer(ohInstance)
                        end)
                    end
                end
            end
        end
    end
    if not playerFound then
        for _, challenge in pairs(challengeFolder:GetChildren()) do
            local playersFolder = challenge:FindFirstChild("Players")
            if playersFolder then
                local playerValue = playersFolder:FindFirstChild(localPlayer.Name)
                if playerValue then
                    playerFound = true
                    local mobFolder = challenge:FindFirstChild("Mob")
                    if mobFolder then
                        for _, mob in pairs(mobFolder:GetChildren()) do
                            local ohInstance = mob.Humanoid
                            pcall(function()
                                localPlayer.Character.PrimaryPart.CFrame = ohInstance.Parent.PrimaryPart.CFrame
                                remote:FireServer(ohInstance)
                            end)
                        end
                    end
                end
            end
        end
    end
end

while killaurafarm do
    pcall(function()
        killaura()
    end)
    wait()
end
