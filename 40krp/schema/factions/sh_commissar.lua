FACTION.name = "Comisario"
FACTION.description = "Un duro comisario, que cumplirá su labor a toda costa."
FACTION.color = Color(105, 13, 33)
FACTION.isDefault = true
FACTION.isGloballyRecognized = true
FACTION.models = {
    "models/ig_commissar.mdl",
    "models/wk/comm/wk_comm.mdl",
    "models/wk/comm/wk_comm_fm.mdl",
    -- Agrega más modelos aquí
}

function FACTION:OnCharacterCreated(client, character)
    local inventory = character:GetInventory()

    inventory:Add("boltpistol", 1)
    inventory:Add("boltammo", 2)
    inventory:Add("powersword", 1)

    character:SetName("Comisario Cadete " .. character:GetName());
end

FACTION_COMMISSAR = FACTION.index