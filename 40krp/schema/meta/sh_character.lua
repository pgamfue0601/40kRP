
local CHAR = ix.meta.character

function CHAR:IsCombine()
	local faction = self:GetFaction()
	return faction == FACTION_MPF or faction == FACTION_OTA
end

function CHAR:IsMechanicus()
	local faction = self:GetFaction()
	return faction == FACTION_MECHANICUS
end