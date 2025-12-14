
local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")

local BADGE_ID = 123456789 -- Set to your badge ID
local REQUIRED_LEVEL = 10 -- Your Perrfered Level

Players.PlayerAdded:Connect(function(player)
	local leaderstats = player:WaitForChild("leaderstats") -- Set to your datastore name
	local level = leaderstats:WaitForChild("Level") -- Set to your datastore levels name

	level.Changed:Connect(function(value)
		if value >= REQUIRED_LEVEL then
			if not BadgeService:UserHasBadgeAsync(player.UserId, BADGE_ID) then
				BadgeService:AwardBadge(player.UserId, BADGE_ID)
			end
		end
	end)
end)