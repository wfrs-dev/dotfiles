conky.config = {
	-- Ejecutarse una sola vez y salir
	total_run_times = 1,

	-- Desactivar la ventana gráfica
	out_to_x = false,
	out_to_wayland = false,
	update_interval = 1,

	-- Activar la salida a la terminal
	out_to_console = true,
	extra_newline = false,
}

conky.text = [[
󰃰  TIME: ${time %d/%B/%Y %I:%M%P}
  CPU: ${cpu}% -  TEMP: ${acpitemp}°C
  RAM: ${mem}(${memperc}%) -   DISK: ${fs_used}(${fs_used_perc}%)
󰛳  IP: ${addr wlp3s0}
󰂄  BAT: ${battery_percent BAT0}% ]]
