for materials = 1, 200 do
  task.wait()
      for i,v in pairs(workspace:FindFirstChild("Materials"):GetChildren()) do
          if v:FindFirstChild("Id") then
             game:GetService("ReplicatedStorage").ClaimMaterial:InvokeServer(v.Id.Value)
          end
      end
end
