local spins = "Spin"

while true do
    game:GetService("ReplicatedStorage").RemoteEventFolder.UpdateManageClientEvent:FireServer(spins)
    wait()
end
