local baseplate = Instance.new("Part")
baseplate.Parent = workspace
baseplate.Size = Vector3.new(100,5,100)
baseplate.Anchored = true
baseplate.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,1000,0) 
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = baseplate.CFrame + Vector3.new(0,10,0)
