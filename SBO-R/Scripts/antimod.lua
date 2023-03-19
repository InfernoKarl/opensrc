local AdminList = {207160289, 18436454, 58736484, 18951266, 1275528885, 663289590, 46478188, 8319210, 36952262, 32873573, 43839070, 90504399, 32985263, 17637379, 682061085, 1258519, 315063621, 394422754, 34923509, 70926245, 1509327150, 265465705, 1277054439, 37784616, 125754354, 5352128, 125287135, 36104793, 414043237, 48921674, 64219597, 27513204, 196467370, 1419777109, 211117443, 3097986992} 
local PrintUsernameOfPlayersJoining = true

local function TeleportToPlace() 

local TeleportService = game:GetService("TeleportService") 
local GameID = game.PlaceId 
local PlayerToTeleport = game.Players.LocalPlayer

TeleportService:Teleport(GameID, PlayerToTeleport)

end

game.Players.PlayerAdded:Connect(function(PlayerAdded) 

if PrintUsernameOfPlayersJoining == true then
print(PlayerAdded.Name .. " Has Joined The Game")
end

for index, value in pairs(AdminList) do 

if PlayerAdded.UserId == value then
TeleportToPlace() 
end

end

end)
