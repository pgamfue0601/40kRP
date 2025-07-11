
-- Running on tick to avoid some HUD conflicts.
function PLUGIN:Tick()
	local client = LocalPlayer()

	for ent, bDraw in pairs(self.terminalsToDraw) do
		if (IsValid(ent) and bDraw) then
			local scrw, scrh = ScrW(), ScrH()

			local camera = ent:GetNWEntity("camera")

			if (IsValid(camera) and camera:GetClass() == "npc_combine_camera") then
				local bonePos, boneAngles = camera:GetBonePosition(camera:LookupBone("Combine_Camera.bone1"))
				local camPos, camAngles = camera:GetBonePosition(camera:LookupBone("Combine_Camera.Lens"))

				boneAngles.roll = boneAngles.roll + 90

				local bulbColor = camera:GetChildren()[1]:GetColor()
				local statusText = "All Clear"
				local signalText = "[512x256/p15@TR42/036]#=i" .. camera:EntIndex() .. "y=" .. math.floor(boneAngles.yaw) .. "&r=" .. math.floor(boneAngles.roll)
				if (bulbColor.g == 128) then
					statusText = "Watching..."
				elseif (bulbColor.g == 0) then
					statusText = "Violation!"
				end

				render.PushRenderTarget(ent.tex)
					if (self:isCameraEnabled(camera)) then
						if (ent.lastCamOutputTime == nil or RealTime() - ent.lastCamOutputTime >= (1 / 15)) then
							render.RenderView({
								origin = camPos + (boneAngles:Forward() * 2.8),
								angles = boneAngles,
								fov = 90,
								aspect = 2,
								x = 0,
								y = 0,
								w = 512,
								h = 256,
								drawviewmodel = false
							})

							ent.lastCamOutputTime = RealTime()
						end
					else
						render.Clear(0, 0, 0, 255, false, true)
						statusText = "Disabled"
						signalText = "no signal(?)"
						bulbColor = Color(255, 0, 0)
					end

					cam.Start2D()
						draw.SimpleText("<:: C-i" .. camera:EntIndex() .. " ::>", "BudgetLabel", 4, 6)
						draw.SimpleText("<:: " .. statusText .. " ::>", "BudgetLabel", 4, 6 + draw.GetFontHeight("BudgetLabel"), bulbColor)
						draw.SimpleText(signalText, "BudgetLabel", 4, 252 - draw.GetFontHeight("BudgetLabel"))
						draw.SimpleText("*", "CloseCaption_Normal", 256, 126, bulbColor, 1, 1)
					cam.End2D()
				render.PopRenderTarget()

				ent.mat:SetTexture("$basetexture", ent.tex)
				ent:SetSubMaterial(1, "!" .. ent.mat:GetName())
			else
				ent:SetSubMaterial(1, "models/props_combine/combine_interface_disp")
			end
		end
	end
end

function PLUGIN:HUDPaint()
	local client = LocalPlayer()

	if (client:IsCombine() or client:IsMechanicus()) then
		local colorRed = Color(255, 0, 0, 255)
		local colorObject = Color(150, 150, 200, 255)
		local fontHeight = draw.GetFontHeight("BudgetLabel")

		local curTime = CurTime()

		local lowDetailBox = math.floor(ScrW() / 16)
		local halfScrVector = Vector(ScrW() / 2, ScrH() / 2)
		local lowDetailText = "<...>"

		local requestColor = Color(175, 125, 100, 255)

		local bUnobstruct = ix.config.Get("biosignalUnobstruct")
		local biosignalDist = ix.config.Get("biosignalDistance")

		local beholder = client
		local beholderEyePos = beholder:EyePos()

		local biosignalExpiry = ix.config.Get("expireBiosignals")

		local socioColor = self.sociostatusColors[self.socioStatus] or color_white

		local info = {x = ScrW() - 8, y = 8}

		if (self.socioStatus == "BLACK") then
			local tsin = TimedSin(1, 0, 255, 0)
			socioColor = Color(tsin, tsin, tsin)
		end

		socioColor = Color(socioColor.r, socioColor.g, socioColor.b, 255)

		draw.SimpleText("<:: Rituales designados = COMPLETADOS ::>", "BudgetLabel", info.x, info.y, socioColor, TEXT_ALIGN_RIGHT)
		info.y = info.y + fontHeight

		draw.SimpleText("<:: Buscar servidores -- SOLICITUD PENDIENTE ::>", "BudgetLabel", info.x, info.y + 5, socioColor, TEXT_ALIGN_RIGHT)
		
	end
end
