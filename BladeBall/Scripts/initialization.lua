local UserInputService = game:GetService("UserInputService")

local function isPlayerOnMobile()
    if UserInputService.TouchEnabled and (UserInputService.KeyboardEnabled or UserInputService.GamepadEnabled) then
        return false
    end
    
    return UserInputService.TouchEnabled
end

local Rayfield

if isPlayerOnMobile() then
    Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AArrayfield%20Library'))()
else
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end

local Window = Rayfield:CreateWindow({
    Name = "Blade Ball Initialization",
    LoadingTitle = "Inferno Scripts",
    LoadingSubtitle = "by InfernoKarl",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = "Inferno Scripts",
       FileName = "Inferno Scripts"
    },
    Discord = {
       Enabled = true,
       Invite = "hNX8VxcjMF",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "Inferno Scripts",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/hNX8VxcjMF)",
       FileName = "InfernoKey",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = "Hello"
    }
 })
 
local ScriptOptions = Window:CreateTab("Options", 13014546637)

local PingParry = ScriptOptions:CreateButton({
    Name = "Ping-Based Distance Parry",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernoKarl/opensrc/main/BladeBall/Scripts/autoparry-automatic.lua", true))()
 end,
})

local ManualParry = ScriptOptions:CreateButton({
    Name = "Adjustable Distance Parry",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernoKarl/opensrc/main/BladeBall/Scripts/autoparry.lua", true))()
 end,
})
