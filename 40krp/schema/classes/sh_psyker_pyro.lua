CLASS.name = "Psiquico Pirokinetico"
CLASS.description = "Un psiquico especializado en el control del fuego."
CLASS.faction = FACTION_PSYKER
CLASS.isDefault = false
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

CLASS_PYROKINESIS = CLASS.index