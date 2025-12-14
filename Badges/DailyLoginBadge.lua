local DataStoreService = game:GetService("DataStoreService")
local BadgeService = game:GetService("BadgeService")

local store = DataStoreService:GetDataStore("LoginData")
local BADGE_ID = 123456789 --Change to ID of badge.
local REQUIRED_DAYS = 7 -- Your Perrfered amount of days

game.Players.PlayerAdded:Connect(function(player)
	local data = store:GetAsync(player.UserId) or {days = 0}
	data.days += 1
	store:SetAsync(player.UserId, data)

	if data.days >= REQUIRED_DAYS then
		BadgeService:AwardBadge(player.UserId, BADGE_ID)
	end
end)