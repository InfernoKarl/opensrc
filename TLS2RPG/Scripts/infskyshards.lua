local args = {
    [1] = "Buy",
    [2] = "Shards",
    [3] = -1000000000000000000,
    [4] = "Thorned Axe"
}

game:GetService("Players").LocalPlayer.RemoteFunctions.SwordSystem:FireServer(unpack(args))
