-- THIS SCRIPT IS PATCHED, AND WILL NOT WORK PROPERLY

getgenv().MagEn = true

local Client = game:GetService("Players").LocalPlayer
local MagicEnergy = Client.bin.MagicEnergy

OldNewIndex = hookmetamethod(game, "__newindex", function(self, index, value)
    if MagEn and checkcaller() == false then
        if (self == MagicEnergy) and index == "Value" then
            value = 605
        end
    end
    return OldNewIndex(self, index, value)
end)
