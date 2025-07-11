FACTION.name = "Felinido"
FACTION.description = "Una aberración de la naturaleza levemente aceptada dentro de las filas del Astra Militarum.\nSolo tendrás una oportunidad, escoria mutante."
FACTION.color = Color(174, 175, 78)
FACTION.isDefault = true
FACTION.isGloballyRecognized = true
FACTION.models = {
    "models/wk/jackswan/abhuman/felinid_female.mdl",
    "models/wk/jackswan/abhuman/felinid_male.mdl"
    -- Agrega más modelos aquí
}

function FACTION:OnCharacterCreated(client, character)
    local inventory = character:GetInventory()

    inventory:Add("lasgun", 1)
    inventory:Add("lasammo", 2)
    inventory:Add("knife", 1)

    character:SetName("Probitor Auxiliar " .. character:GetName());
end

FACTION_FELINID = FACTION.index
