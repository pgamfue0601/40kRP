CLASS.name = "Psiquico Minoris"
CLASS.description = "Un psiquico de capacidades limitadas."
CLASS.faction = FACTION_PSYKER
CLASS.isDefault = true
function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
        
    end

    function CLASS:OnSpawn(client)
    end
end

CLASS_PSYKERMINORIS = CLASS.index