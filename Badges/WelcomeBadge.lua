local Players = game:GetService("Players")
local BadgeService = game:GetService("BadgeService")
local BADGE_ID = 123456789

local function awardBadgeToPlayer(userId)
	local success, result = pcall(BadgeService.AwardBadge, BadgeService, userId, BADGE_ID)
	if not success then
		warn("Failed to award badge: " .. tostring(result))
	end
end

Players.PlayerAdded:Connect(function(player)
	for _, other in ipairs(Players:GetPlayers()) do
		if other ~= player then -- Don't check friendship with self
			local success, areFriends = pcall(Players.AreFriendsAsync, Players, player.UserId, other.UserId)
			if success and areFriends then
				awardBadgeToPlayer(player.UserId)
				awardBadgeToPlayer(other.UserId)
			end
		end
	end
end)