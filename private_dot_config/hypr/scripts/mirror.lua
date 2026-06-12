---@diagnostic disable: need-check-nil

local M = {}
local mirroring = false

--- Active/désactive le mode mirroir.
--
-- Réplique l'écran actif sur les autres écrans ou désactive la réplication.
-- S'il y a un seul écran, ne fait rien.
function M.toggle_mirror()
	if #hl.get_monitors() == 1 and not mirroring then
		hl.exec_cmd('notify-send -u low "Mode mirroir" "Aucun autre écran."')
		return
	end

	local active = hl.get_active_monitor()

	if mirroring then
		hl.exec_cmd("hyprctl reload")
		mirroring = false
		hl.exec_cmd('notify-send -u low "Mode mirroir" "Le partage est désactivé."')
	else
		for _, m in ipairs(hl.get_monitors()) do
			if m.name ~= active.name then
				hl.monitor({ output = m.name, mirror = active.name })
			end
		end
		mirroring = true
		hl.notification()
		hl.exec_cmd('notify-send -u low "Mode mirroir" "L\'écran actuel est partagé."')
	end
end

return M
