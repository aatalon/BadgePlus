local BadgeService = game:GetService("BadgeService")
local BADGE_ID = 123456789 -- Set to your badge ID
local REQUIRED_KILLS = 25 -- Your Perrfered amount of Kills

game.Players.PlayerAdded:Connect(function(player)
	local stats = player:WaitForChild("leaderstats") -- Set to your datastore name
	local kills = stats:WaitForChild("Kills") -- Set to your datastore kills name

	kills.Changed:Connect(function(value)
		if value >= REQUIRED_KILLS then
			BadgeService:AwardBadge(player.UserId, BADGE_ID)
		end
	end)
end)