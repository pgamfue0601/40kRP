local PLUGIN = PLUGIN

PLUGIN.name = "Faction Fonts"
PLUGIN.description = "Adds different fonts to different factions"
PLUGIN.author = "gb"

-- Configuration for enabling faction-based fonts
ix.config.Add("allowFactionFonts", true, "Whether or not different fonts for different factions are enabled. (Only OTAs and Dispatch)", nil, {
    category = "Chat"
})

-- Determine the font for normal speech based on faction
function PLUGIN:GetSpeakerFont(client)
    local character = client:GetCharacter()
    if not character then return "ixChatFont" end

    local faction = character:GetFaction()
    if ix.config.Get("allowFactionFonts", true) then
        if faction == FACTION_MECHANICUS then
            return "ixcustomDispatchFont"
        end
    end
    return "ixChatFont"
end

-- Determine the font for yelling based on faction
function PLUGIN:GetSpeakerYellFont(client)
    local character = client:GetCharacter()
    if not character then return "ixChatYellFont" end

    local faction = character:GetFaction()
    if ix.config.Get("allowFactionFonts", true) then
        if faction == FACTION_MECHANICUS then
            return "ixcustomDispatchYellFont"
        end
    end
    return "ixChatYellFont"
end

-- Hook to load fonts on the client
if CLIENT then
    function PLUGIN:LoadFonts(font, genericFont)
        surface.CreateFont("ixcustomDispatchFont", {
            font = "Alien Encounters",
            size = math.max(ScreenScale(7), 16) * ix.option.Get("chatFontScale", 1),
            extended = true,
            weight = 750,
            antialias = false
        })

        surface.CreateFont("ixcustomDispatchFontItalic", {
            font = "Alien Encounters",
            size = math.max(ScreenScale(7), 16) * ix.option.Get("chatFontScale", 1),
            extended = true,
            weight = 750,
            antialias = true,
            italic = true
        })

        surface.CreateFont("ixcustomDispatchYellFont", {
            font = "Alien Encounters",
            size = math.max(ScreenScale(8), 17) * ix.option.Get("chatFontScale", 1),
            extended = true,
            weight = 800,
            antialias = false
        })

        surface.CreateFont("ixcustomDispatchYellFontItalic", {
            font = "Alien Encounters",
            size = math.max(ScreenScale(8), 17) * ix.option.Get("chatFontScale", 1),
            extended = true,
            weight = 800,
            antialias = true,
            italic = true
        })
    end

    -- Hook the font loader to Helix's schema initialization
    function PLUGIN:InitializedChatClasses()
        self:LoadFonts()
    end
end

-- Hook to modify the font used in chat rendering
function PLUGIN:ChatClassPreDraw(speaker, text, chatClass)
    local font = self:GetSpeakerFont(speaker)
    if chatClass == "yell" then
        font = self:GetSpeakerYellFont(speaker)
    end

    chatClass.font = font
end
