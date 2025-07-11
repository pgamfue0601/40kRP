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

    character:SetName("Probitor Auxiliar " .. character:GetName())

    -- Cambiar bodygroups según el modelo seleccionado
    local model = character:GetModel()
    local bodygroups = {}

    if model == "models/dizcordum/wk/ogryn/ogryn_bald.mdl" then
        bodygroups = { [0] = 1 } -- Ejemplo: bodygroup 0 a 1
    elseif model == "models/dizcordum/wk/ogryn/ogryn_krieg.mdl" then
        bodygroups = { [1] = 2 }
    elseif model == "models/dizcordum/wk/ogryn/ogryn_bonehead.mdl" then
        bodygroups = { [2] = 1 }
    elseif model == "models/dizcordum/wk/ogryn/ogryn_bullgryn.mdl" then
        bodygroups = { [0] = 2, [1] = 1 }
    end

    -- Aplica los bodygroups al personaje
    for k, v in pairs(bodygroups) do
        character:SetData("bodygroup_" .. k, v)
    end

    -- Cuando el jugador spawnea, aplica los bodygroups al modelo
    timer.Simple(0, function()
        if IsValid(client) and client:GetCharacter() == character then
            for k, v in pairs(bodygroups) do
                client:SetBodygroup(k, v)
            end
        end
    end)
end

FACTION_OGRYN = FACTION.index