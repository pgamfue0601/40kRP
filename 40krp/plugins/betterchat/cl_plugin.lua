ix.option.Add("chatIndicators", ix.type.bool, true, {
	category = "Better Chat"
})

local typing = false
local command = ""

local symbolPattern = "[~`!@#$%%%^&*()_%+%-={}%[%]|;:'\",%./<>?]"

-- Crear fuentes personalizadas para Mechanicus
surface.CreateFont("ixMechanicusChatFont", {
	font = "LED Calculator",
	size = ScreenScale(7),
	weight = 500,
	extended = true
})

surface.CreateFont("ixMechanicusChatFontItalic", {
	font = "LED Calculator",
	size = ScreenScale(7),
	weight = 500,
	italic = true,
	extended = true
})

-- Lista de chat types que usan fuente normal de Mechanicus
local mechanicusNormalTypes = {
	["ic"] = true,
	["whisper"] = true,
	["w"] = true,        -- /w en Helix
	["yell"] = true,
	["y"] = true,        -- /y en Helix
	["radio"] = true,
	["scream"] = true
}

-- Lista de chat types que usan fuente itálica de Mechanicus (acciones/estados)
local mechanicusItalicTypes = {
	["me"] = true,
	["meclose"] = true,
	["mefar"] = true,
	["mefarfar"] = true,
	["it"] = true,
	["itclose"] = true,
	["itfar"] = true,
	["itfarfar"] = true
}

-- Función para configurar el hook de Mechanicus en el chat
local function SetupMechanicusChat()
	if (!ix or !ix.chat or !ix.chat.Send or ix.chat.mechanicusBetterChatHooked) then return end
	
	local originalChatSend = ix.chat.Send
	ix.chat.mechanicusBetterChatHooked = true
	
	ix.chat.Send = function(speaker, chatType, text, anonymous, data)
		local chatClass = ix.chat.classes[chatType]
		local originalFont = nil
		local newFont = nil
		
		-- Verificar si el speaker es Mechanicus
		if (IsValid(speaker) and speaker:GetCharacter()) then
			local faction = speaker:GetCharacter():GetFaction()
			
			if (faction == FACTION_MECHANICUS) then
				-- Determinar qué fuente usar
				if (mechanicusItalicTypes[chatType]) then
					newFont = "ixMechanicusChatFontItalic"
				elseif (mechanicusNormalTypes[chatType]) then
					newFont = "ixMechanicusChatFont"
				end
			end
		end
		
		-- Cambiar la fuente temporalmente si es Mechanicus
		if (newFont and chatClass) then
			originalFont = chatClass.font
			chatClass.font = newFont
		end
		
		-- Llamar la función original
		originalChatSend(speaker, chatType, text, anonymous, data)
		
		-- Restaurar la fuente original
		if (originalFont ~= nil and chatClass) then
			chatClass.font = originalFont
		elseif (newFont and chatClass) then
			chatClass.font = nil
		end
	end
end

-- Intentar configurar el hook en varios momentos
hook.Add("InitPostEntity", "MechanicusBetterChatSetup", function()
	timer.Simple(1, SetupMechanicusChat)
end)

hook.Add("InitializedChatClasses", "MechanicusBetterChatSetup", function()
	timer.Simple(0.1, SetupMechanicusChat)
end)

hook.Add("CharacterLoaded", "MechanicusBetterChatSetup", function()
	SetupMechanicusChat()
end)

-- También intentar después de un delay mayor para asegurar que betterchat haya registrado sus clases
timer.Simple(35, SetupMechanicusChat)

local function GetTypingIndicator(text)
	local prefix = text:utf8sub(1, 1)

	if (!prefix:find(symbolPattern) and text:utf8len() > 1) then
		return "ic"
	else
		local chatType = ix.chat.Parse(nil, text)

		if (chatType and chatType != "ic") then
			return chatType
		end

		local start, _, commandName = text:find("/(%S+)%s")

		if (start == 1) then
			for uniqueID, _ in pairs(ix.command.list) do
				if (commandName == uniqueID) then
					return uniqueID
				end
			end
		end
	end
end

function PLUGIN:ChatTextChanged(text)
	if (text == "") then
		typing = false
		command = ""
	else
		typing = true
		command = GetTypingIndicator(text)
	end
end

function PLUGIN:FinishChat()
	typing = false
	command = ""
end

function PLUGIN:PostDrawTranslucentRenderables()
	if (!typing or !ix.option.Get("chatIndicators", true)) then return end

	local radius = 0

	if (ix.command.list[command] and ix.command.list[command]["range"]) then
		radius = ix.command.list[command]["range"]
	elseif (ix.chat.classes[command] and ix.chat.classes[command]["range"]) then
		radius = math.sqrt(ix.chat.classes[command]["range"])
	end

	if (radius == 0) then return end

	local pos = LocalPlayer():GetPos()

	render.DrawWireframeSphere(pos, radius, 12, 12, Color(184, 65, 57), true)

	render.SetColorMaterial()

	render.DrawSphere(pos, -radius, 12, 12, Color(184, 65, 57, 25))
	render.DrawSphere(pos, radius, 12, 12, Color(184, 65, 57, 25))
end