local args = {
    [1] = game:GetService("Players").LocalPlayer.attributes.Intelligence,
    [2] = -8000
}
 -- Max stat points per attribute is 2000 - don't put any stat points back in Magic/Intelligence, its useless
game:GetService("ReplicatedStorage").GivePoints:FireServer(unpack(args))
