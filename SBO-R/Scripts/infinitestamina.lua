getgenv().InfiniteStuff = true

local Client = game:GetService("Players").LocalPlayer
local PlayerStats = game:GetService("Players")[Client.Name].PlayerGui.GameGui
local Stamina = PlayerStats.Stamina

OldNewIndex = hookmetamethod(game, "__newindex", function(self, index, value)
    if InfiniteStuff and checkcaller() == false then
        if (self == Stamina) and index == "Value" then
            value = math.huge
        end
    end
    return OldNewIndex(self, index, value)
end)
