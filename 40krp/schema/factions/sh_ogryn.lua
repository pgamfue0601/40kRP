FACTION.name = "Ogrete"
FACTION.description = "Una mole de carne, tonta pero lista para acatar ordenes."
FACTION.color = Color(150, 2, 15, 255)
FACTION.faction = FACTION_OGRYN
FACTION.isDefault = true
FACTION.isGloballyRecognized = true
FACTION.models = {
    "models/dizcordum/wk/ogryn/ogryn_bald.mdl",
    "models/dizcordum/wk/ogryn/ogryn_krieg.mdl",
    "models/dizcordum/wk/ogryn/ogryn_bonehead.mdl",
    "models/dizcordum/wk/ogryn/ogryn_bullgryn.mdl",
}
function FACTION:OnCharacterCreated(client, character)
    local inventory = character:GetInventory()

    inventory:Add("ripper", 1)
    inventory:Add("ripperammo", 2)
    inventory:Add("ogrynmace", 1)

    character:SetName("Probitor Auxiliaris " .. character:GetName())
end

FACTION_OGRYN = FACTION.index