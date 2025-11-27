CLASS.name = "Psiquico Minoris"
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