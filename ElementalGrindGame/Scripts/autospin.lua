local desiredElements = {
    "Dragon", "Heaven's Wrath", "Arc of The Elementals", "Time", "Telekinesis",
    "Necromancer", "Destruction", "Acceleration", "Solar", "Phoenix", "Cosmic",
    "Hydra", "Lunar", "Illusion", "Prism", "Mechanization", "Lava", "Sound", "Chaos",
    "Radiation", "Plasma", "Armament" -- Remove any that you don't want, I just added everything Rare+
}

local function click(a)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
end

local function containsDesiredElement(text)
    for _, word in ipairs(desiredElements) do
        if string.find(text, word) then
            return true
        end
    end
    return false
end

local player = game:GetService("Players").LocalPlayer
local textLabel = player.PlayerGui.Spinner.Frame.NameOutline.TextLabel
local spinButton = player.PlayerGui.Spinner.Frame.Spin

while true do
    if spinButton.TextLabel.Text == "Not enough spins." then
        break
    end
    
    click(spinButton)
    wait(0.5)

    if containsDesiredElement(textLabel.Text) then
        break
    end
end
