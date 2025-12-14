local players = game:GetService("Players")
local getPlayerFromCharacter = players.GetPlayerFromCharacter
local badges = game:GetService("BadgeService")
local userHasBadge = badges.UserHasBadgeAsync
local awardBadge = badges.AwardBadge

local badgeId = 0 --Change to ID of badge.
local part = workspace.Part --Path to the BasePart instance.

local function onTouched(hit)
	local hitModel = hit:FindFirstAncestorOfClass("Model")
	if not hitModel then return end
	local hitPlayer = getPlayerFromCharacter(players, hitModel)
	if not hitPlayer then return end
	local hitHuman = hitModel:FindFirstChildOfClass("Humanoid")
	if not hitHuman then return end
	if hitHuman.Health <= 0 then return end
	local success, result = pcall(userHasBadge, badges, hitPlayer.UserId, badgeId)
	if success then
		if not result then
			local success2, result2 = pcall(awardBadge, badges, hitPlayer.UserId, badgeId)
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

part.Touched:Connect(onTouched)