FACTION.name = "Adeptus Mechanicus"
FACTION.description = "Un devoto sirviente del culto a la Máquina, nunca descansará en su búsqueda de más conocimiento. Aún si eso le hará sacrificar unos cuantos 'activos'."
FACTION.color = Color(150, 50, 50, 255)
FACTION.models = {
	"models/wk/adeptus_mechanicus/wk_am_engenseer.mdl",
	"models/wk/adeptus_mechanicus/wk_tech_priest.mdl",
	"models/wk/adeptus_mechanicus/wk_am_hypaspists_alpha.mdl",
	"models/wk/adeptus_mechanicus/wk_trippriest.mdl",
	"models/wk/adeptus_mechanicus/wk_skitarii_rangers_alpha.mdl"
}
FACTION.isDefault = true 
FACTION.isGloballyRecognized = true
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()

	
end

function FACTION:GetDefaultName(client)
	return "Magos " .. string.char(math.random(65, 65 + 25)) .. string.char(math.random(65, 65 + 25)) .. ":" .. Schema:ZeroNumber(math.random(1, 999), 3), true
end

function FACTION:OnTransferred(character)
	character:SetName(self:GetDefaultName())
	character:SetModel(self.models[1])
end

FACTION_MECHANICUS = FACTION.index
