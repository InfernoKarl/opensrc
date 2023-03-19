local args = {
    [1] = "Buy",
    [2] = "Gold",
    [3] = 0,
    [4] = "Redcliff Pacifier"
}

game:GetService("Players").LocalPlayer.RemoteFunctions.SwordSystem:FireServer(unpack(args))
