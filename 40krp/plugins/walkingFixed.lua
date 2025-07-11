local PLUGIN = PLUGIN

PLUGIN.name = "Uniform Walk Speed"
PLUGIN.description = "Forces all player models to walk at a slow and uniform pace."
PLUGIN.author = "Elektro"

-- Configuration for walk and run speeds
ix.config.Add("uniformWalkSpeed", 100, "The walk speed for all players.", nil, {
    category = "Gameplay"
})
ix.config.Add("uniformRunSpeed", 200, "The run speed for all players.", nil, {
    category = "Gameplay"
})
ix.config.Add("uniformSlowWalkSpeed", 50, "The slow walk speed for all players.", nil, {
    category = "Gameplay"
})

-- Hook to adjust player speeds when they spawn
function PLUGIN:PlayerSpawn(client)
    local walkSpeed = ix.config.Get("uniformWalkSpeed", 100)
    local runSpeed = ix.config.Get("uniformRunSpeed", 200)
    local slowWalkSpeed = ix.config.Get("uniformSlowWalkSpeed", 50)

    client:SetWalkSpeed(walkSpeed)
    client:SetRunSpeed(runSpeed)
    client:SetSlowWalkSpeed(slowWalkSpeed)
end

-- Hook to enforce walking speed during sprint or other actions
function PLUGIN:PlayerButtonDown(client, button)
    if button == KEY_WALK then -- Detect if the slow walk key is held (default: Alt)
        client:SetWalkSpeed(ix.config.Get("uniformSlowWalkSpeed", 50))
    else
        client:SetWalkSpeed(ix.config.Get("uniformWalkSpeed", 100))
    end
end
