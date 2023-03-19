getgenv().AntiFreeze = true

local Client = game:GetService("Players").LocalPlayer
local PlayerValues = Client.PlayerGui
local Heat = PlayerValues.Heat

OldNewIndex = hookmetamethod(game, "__newindex", function(self, index, value)
    if AntiFreeze and checkcaller() == false then
        if (self == Heat) and index == "Value" then
            value = 120
        end
    end
    return OldNewIndex(self, index, value)
end)
