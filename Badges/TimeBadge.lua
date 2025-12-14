local players = game:GetService("Players")
local badges = game:GetService("BadgeService")
local userHasBadge = badges.UserHasBadgeAsync
local awardBadge = badges.AwardBadge

local badgeId = 0 --Change to ID of badge.
local timeLength = 0 --Change this to a length of time in seconds.

local function giveBadge(player)
	local success2, result2 = pcall(awardBadge, badges, player.UserId, badgeId)
	if success2 then
		if result2 then
			do end
		end
	else
		warn(result2)
	end
end

local function onPlayerAdded(player)
	local success, result = pcall(userHasBadge, badges, player.UserId, badgeId)
	if success then
		if not result then
			task.delay(timeLength, giveBadge, player)
		end
	else
		warn(result)
	end
end

players.PlayerAdded:Connect(onPlayerAdded)