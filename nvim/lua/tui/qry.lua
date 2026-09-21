-- Interfaz para ejecutar el programa qry para ejecutar consultas SQL

if rawget(_G, 'qrycnx') == nil then
	_G.qrycnx = ''
end

local select_connection = function()
	local connections = vim.fn.systemlist('qry list -name')

	if #connections == 0 then
		vim.notify('No hay conexiones disponibles', vim.log.levels.ERROR)
		return
	end

	vim.ui.select(connections, {
		prompt = 'Selecciona una conexión',
		format_item = function(item)
			return item
		end,
	}, function(item)
		_G.qrycnx = item
		vim.notify('Conexión seleccionada: ' .. _G.qrycnx, vim.log.levels.INFO)
	end)
end

local run_gql = function(expand)
	expand = expand or false

	if _G.qrycnx == '' then
		select_connection()
		return
	end

	local command = 'qry run ' .. (expand and '--list ' or '') .. _G.qrycnx
	local cspos = vim.fn.getpos('\'<')
	local ceps = vim.fn.getpos('\'>')

	local csrow, cscol = cspos[2], cspos[3]
	local cerow, cecol = ceps[2], ceps[3]

	-- Ajustar las posiciones para obtener el texto correctamente
	csrow, cscol = csrow - 1, cscol - 1
	cerow, cecol = cerow - 1, cecol - 1

	-- Obtener las líneas seleccionadas
	local lines = vim.fn.getline(csrow + 1, cerow + 1)

	-- Si solo hay una línea seleccionada, recortar el texto seleccionado
	if #lines == 1 then
		lines[1] = string.sub(lines[1], cscol + 1, cecol + 1)
	else
		lines[1] = string.sub(lines[1], cscol + 1)
		lines[#lines] = string.sub(lines[#lines], 1, cecol + 1)
	end

	local input_text = table.concat(lines, '\n')

	-- Ejecutar el comando externo con `stdin`
	local handle = io.popen(command, 'w')
	if handle then
		handle:write(input_text)
		handle:close()
	end

	-- Leer la salida del comando
	local output = vim.fn.systemlist(command, input_text)

	-- Crear un nuevo buffer sin nombre, no listado y sin modificar el estado del editor
	local buf = vim.api.nvim_create_buf(false, true)

	-- Establecer la salida en el nuevo buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)

	-- Crear una ventana en la mitad inferior de la pantalla
	local win_opts = {
		relative = 'editor',
		width = vim.o.columns,
		height = math.floor(vim.o.lines / 3), -- 1/3 de la pantalla
		row = vim.o.lines - math.floor(vim.o.lines / 3) - 1,
		col = 0,
		style = 'minimal',
		border = 'single',
	}
	vim.api.nvim_open_win(buf, true, win_opts) -- Abrir la nueva ventana con el buffer
	-- Hacer el buffer de solo lectura
	vim.api.nvim_buf_set_option(buf, 'modifiable', false)
	vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile') -- Evita que se guarde en un archivo
	vim.api.nvim_buf_set_option(buf, 'swapfile', false) -- No usar swapfile
	vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe') -- Cierra el buffer al cerrar la ventana
	vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
end

return {
	run = run_gql,
	select = select_connection,
}
