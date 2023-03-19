getgenv().InfiniteStam = true

local Client = game:GetService("Players").LocalPlayer
local Stamina = Client.bin.Stamina

OldNewIndex = hookmetamethod(game, "__newindex", function(self, index, value)
    if InfiniteStam and checkcaller() == false then
        if (self == Stamina) and index == "Value" then
            value = 1000
        end
    end
    return OldNewIndex(self, index, value)
end)
