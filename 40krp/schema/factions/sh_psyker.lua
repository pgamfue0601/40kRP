FACTION.name = "Psíquico"
FACTION.description = "Bendecidos (o malditos) con la capacidad de poder canalizar poder de la Disformidad para su gusto, aunque todo conlleva una gran responsabilidad..."
FACTION.color = Color(107, 163, 180)
FACTION.isDefault = true
FACTION.models = {
    "models/wk/psy/wk_wyrdvane.mdl",
    "models/wk/psy/wk_wyrdvane_fem.mdl",
    "models/wk/psy/wk_primaris_psyker.mdl",
    "models/wk/psy/wk_primaris_fem.mdl"
}
    function FACTION:OnCharacterCreated(client, character)
        local inventory = character:GetInventory()

        
    end


FACTION_PSYKER = FACTION.index