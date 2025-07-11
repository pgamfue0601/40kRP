FACTION.name = "Ratling"
FACTION.description = "Ruidosos, hambrientos, lascivos y chiquituzos.\nLos Ratlings son excelentes unidades para enfrentamientos a larga distancia."
FACTION.color = Color(107, 76, 18)
FACTION.isDefault = true
FACTION.isGloballyRecognized = true
FACTION.models = {
    "models/wk/jackswan/abhumans/ratling/ratling.mdl",
}

function FACTION:OnCharacterCreated(client, character)
    local inventory = character:GetInventory()
    inventory:Add("ratlingsniper", 1)

    character:SetName("Probitor " .. character:GetName());
end

FACTION_RATLING = FACTION.index