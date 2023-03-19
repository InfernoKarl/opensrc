local player = game:GetService("Players").LocalPlayer

local function teleportToCloversAndBoxes()
   local cloversFolder = workspace:FindFirstChild("Clovers")

   if cloversFolder then
       for _, clover in ipairs(cloversFolder:GetChildren()) do
           local proximityPrompt = clover:FindFirstChildOfClass("ProximityPrompt")
           if proximityPrompt then
               local parent = clover
               player.Character:SetPrimaryPartCFrame(parent.CFrame)
               wait(0.1)
               fireproximityprompt(proximityPrompt)
           end
       end
   else
       print("Clovers folder not found in workspace, event may have ended.")
   end

   local boxesFolder = workspace:FindFirstChild("Boxes")

   if boxesFolder then
   for _, box in ipairs(boxesFolder:GetChildren()) do
       local parent = box
       player.Character:SetPrimaryPartCFrame(parent.CFrame)
       wait(1)
   end
else
   warn("boxes????????? where go?????????")
end
end

while true do
   teleportToCloversAndBoxes()
   wait(5)
end
