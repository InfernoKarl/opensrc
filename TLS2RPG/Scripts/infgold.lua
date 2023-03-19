local args = {
    [1] = "Buy",
    [2] = "Gold",
    [3] = -99999999999999,
    [4] = "Dark Axe"
}

game:GetService("Players").LocalPlayer.RemoteFunctions.SwordSystem:FireServer(unpack(args))
