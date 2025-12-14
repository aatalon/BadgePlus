local players = game:GetService("Players")
local badges = game:GetService("BadgeService")
local userHasBadge = badges.UserHasBadgeAsync
local awardBadge = badges.AwardBadge

local badgeId = 0 --Change to ID of badge.
local groupId = 0 --Change to ID of group.

local function onPlayerAdded(player)
	local isInGroup = player.IsInGroup
	local success, result = pcall(isInGroup, player, groupId)
	if success then
		if result then
			local success2, result2 = pcall(userHasBadge, badges, player.UserId, badgeId)
			if success2 then
				if not result2 then
					local success3, result3 = pcall(awardBadge, badges, player.UserId, badgeId)
					if success3 then
						if result3 then
							do end
						end
					else
						warn(result3)
					end
				end
			else
				warn(result2)
			end
		end
	else
		warn(result)
	end
end

players.PlayerAdded:Connect(onPlayerAdded)