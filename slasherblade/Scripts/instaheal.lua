local regen = 9e9

while task.wait() do
    game:GetService("ReplicatedStorage").Remote.Event.Up["[C-S]TryRegen"]:FireServer(regen)
end
