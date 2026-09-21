conky.config = {
	out_to_console = true,
	out_to_x = false,
	out_to_wayland = false,
	update_interval = 5,
	total_run_times = 0,
	user_spacer = "none",
	short_units = true,
	cpu_avg_samples = 2,
	net_avg_samples = 2,
	override_utf8_locale = true,
}

-- conky.text = [[
-- [󰃰 ${time %d/%B/%Y %I:%M%P}][ ${cpu}%][ ${acpitemp}°C][ ${mem}(${memperc}%)][ ${fs_used}(${fs_used_perc}%)][󰛳 ${addr wlp3s0}] [${battery_percent BAT0}%]
-- ]]
conky.text = [[
[󰃰 ${time %d/%B/%Y %I:%M%P}][ ${cpu}%][ ${acpitemp}°C][ ${mem}(${memperc}%)][ ${fs_used}(${fs_used_perc}%)][󰛳 ${addr enp1s0}]
]]
