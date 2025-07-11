FACTION.name = "Conscripto"
FACTION.description = "Un conscripto nuevo, listo para ser carne de cañon."
FACTION.color = Color(65, 145, 76)
FACTION.isGloballyRecognized = true
FACTION.isDefault = true
FACTION.models = {
    "models/player/impy/guardsman.mdl",
    "models/malkiax/rhinocompany/female_00.mdl",
    "models/malkiax/rhinocompany/female_01.mdl",
    "models/malkiax/rhinocompany/female_03.mdl",
    "models/malkiax/rhinocompany/female_04.mdl",
    "models/malkiax/rhinocompany/female_06.mdl",
    "models/malkiax/rhinocompany/female_07.mdl",
    "models/malkiax/rhinocompany/male_00.mdl",
    "models/malkiax/rhinocompany/male_01.mdl",
    "models/malkiax/rhinocompany/male_02.mdl",
    "models/malkiax/rhinocompany/male_03.mdl",
    "models/malkiax/rhinocompany/male_04.mdl",
    "models/malkiax/rhinocompany/male_05.mdl",
    "models/malkiax/rhinocompany/male_06.mdl",
    "models/malkiax/rhinocompany/male_07.mdl",
    "models/malkiax/rhinocompany/male_08.mdl",
    "models/malkiax/rhinocompany/male_09.mdl",
    -- Agrega más modelos aquí
}


function FACTION:OnCharacterCreated(client, character)
    local inventory = character:GetInventory()

    inventory:Add("lasgun", 1)
    inventory:Add("lasammo", 2)
    inventory:Add("knife", 1)

    character:SetName("Probitor " .. character:GetName());

end

FACTION_GUARD = FACTION.index
