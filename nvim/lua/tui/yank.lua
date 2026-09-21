if _G.yank_history == nil then
	_G.yank_history = {}
end

local function atrim(s)
	return s:match('^%s*(.-)%s*$')
end

local function add_to_yank_history()
	local yanked_text = vim.fn.getreg('"') -- Captura el texto yankeado desde el registro "
	table.insert(_G.yank_history, yanked_text)

	local aux = {}
	for _, v in ipairs(_G.yank_history) do
		if atrim(v) ~= '' then
			table.insert(aux, v)
		end
	end

	_G.yank_history = aux
end

-- Configura el autocomando para capturar cada yank
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = add_to_yank_history,
	pattern = '*',
})

-- recorta el texto a una longitud max y agrega "..." al final
local function recortarTexto(texto, max)
	if #texto > max then
		return string.sub(texto, 1, max) .. '...'
	else
		return texto
	end
end

-- procesa el formato de seleccion
local function fmt(txt)
	local sufix = (string.len(txt) > 47 and '...' or '')
	return string.format('󰩷 %s%s', string.gsub(txt:sub(1, 47), '[\r\n]', ' '), sufix)
end

local function show_yank_history()
	vim.ui.select(_G.yank_history, {
		prompt = 'Yank history:',
		format_item = function(item)
			return fmt(item)
		end,
	}, function(choice)
		if choice == nil then
			vim.notify('Yank history is empty', vim.log.levels.WARN)
			return
		end

		vim.fn.setreg('"', choice, 'v')
		vim.notify('Yanked text: ' .. recortarTexto(choice, 30), vim.log.levels.INFO)
	end)
end

return {
	yankHistory = show_yank_history,
}
