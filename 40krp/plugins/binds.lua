local PLUGIN = PLUGIN

PLUGIN.name = "Key Binding"
PLUGIN.author = "Usuariozombie"
PLUGIN.description = "Añade la posibilidad de asignar teclas para ciertas funciones."

PLUGIN.bind = KEY_P

if (CLIENT) then
	function PLUGIN:PlayerButtonDown(client, button)
		if (input.LookupKeyBinding(self.bind) == "ix_togglethirdperson") then
			return
		end

		local curTime = CurTime()

		if (button == self.bind and (!client.nextBind or client.nextBind <= curTime)) then
			client:ConCommand("ix_togglethirdperson")
			client.nextBind = curTime + 0.1
		end
	end
end