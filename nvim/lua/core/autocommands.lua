local fn = require('core.fn')

-- Mostrar texto copiado
-- See `:help vim.highlight.on_yank()`
fn.autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	pattern = '*',
})

-- Configuracion de ventana de quickfix
fn.autocmd('FileType', {
	pattern = { 'quickfix' },
	callback = function()
		vim.cmd('setlocal nolist')
		vim.cmd('setlocal nonumber')
		vim.cmd('setlocal cursorline')
	end,
})

-- Auto-abrir quickfix si hay resultados y cerrarla si está vacía
fn.autocmd('QuickFixCmdPost', {
	pattern = '*grep*',
	callback = function()
		vim.cmd('cwindow')
		if vim.fn.empty(vim.fn.filter(vim.fn.getqflist(), 'v:val.valid')) == 1 then
			vim.cmd('cclose')
		end
	end,
})

fn.autocmd('BufReadPost', {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- No comentar nuevas líneas
fn.autocmd('BufEnter', {
	callback = function()
		vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
	end,
})

-- formatear sql
fn.usercmd('PgFormat', function()
	local start_line = vim.fn.line('\'<')
	local end_line = vim.fn.line('\'>')

	if start_line == end_line and vim.fn.getline(start_line) == '' then
		vim.notify('No hay texto seleccionado', vim.log.levels.WARN)
		return
	end

	local cmd = string.format('%d,%d!pg_format -f 2 -bTC -w 80 2>/dev/null | sed \'s/\\([^\\s]\\) ,/\\1,/g\'', start_line, end_line)

	vim.cmd(cmd)
end, { range = true })
