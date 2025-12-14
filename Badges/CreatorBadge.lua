local players = game:GetService("Players")
local getPlayers = players.GetPlayers
local groups = game:GetService("GroupService")
local getGroupInfo = groups.GetGroupInfoAsync
local badges = game:GetService("BadgeService")
local userHasBadge = badges.UserHasBadgeAsync
local awardBadge = badges.AwardBadge

local ownerId --Leave this as nil.
local badgeId = 0 --Change to ID of badge.

local function getOwner()
	if game.CreatorType == Enum.CreatorType.User then
		ownerId = game.CreatorId
	elseif game.CreatorType == Enum.CreatorType.Group then
		local success, result = pcall(getGroupInfo, groups, game.CreatorId)
		if success then
			if result then
				ownerId = result.Owner.Id
			end
		else
			warn(result)
		end
	end
end

local function onPlayerAdded(player)
	if not ownerId then getOwner() end
	for _, otherPlayer in ipairs(getPlayers(players)) do
		if otherPlayer.UserId == ownerId then
			local success, result = pcall(userHasBadge, badges, player.UserId, badgeId)
			if success then
				if not result then
					local success2, result2 = pcall(awardBadge, badges, player.UserId, badgeId)
					if success2 then
						if result2 then
							do end
						end
					else
						warn(result2)
					end
				end
			else
				warn(result)
			end
		end
	end
end

players.PlayerAdded:Connect(onPlayerAdded)