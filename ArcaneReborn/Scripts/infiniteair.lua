getgenv().InfiniteAir = true

local Client = game:GetService("Players").LocalPlayer
local Air = Client.bin.Air

OldNewIndex = hookmetamethod(game, "__newindex", function(self, index, value)
    if InfiniteAir and checkcaller() == false then
        if (self == Air) and index == "Value" then
            value = 100
        end
    end
    return OldNewIndex(self, index, value)
end)
