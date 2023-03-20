local function tpup()
    local player = game.Players.LocalPlayer
    if player.Character then
        player.Character.PrimaryPart.CFrame = game.Workspace.WinPaths["Golden Tower"].TouchPart.CFrame
    end
end

while true do
    local success, err = pcall(tpup)
    if not success then
        warn("Error teleporting up: " .. err)
    end
    task.wait()
end
