local args = {
    [1] = 10    -- DO NOT CHANGE THIS TO ANYTHING HIGHER THAN TEN! I know its tempting, but any value higher than ten will get you instantly permanently banned.
}

game:GetService("ReplicatedStorage").CatchFish:FireServer(unpack(args))

while wait(300) do
game:GetService("ReplicatedStorage").CatchFish:FireServer(unpack(args))
end
