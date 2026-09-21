local M = {}

M.augroup = vim.api.nvim_create_augroup
M.autocmd = vim.api.nvim_create_autocmd
M.usercmd = vim.api.nvim_create_user_command
M.keymap = vim.keymap.set
M.uv = vim.loop
M.cwd = vim.fn.getcwd

M.hasFile = function(fname)
	local path = M.cwd() .. '/' .. fname
	return M.uv.fs_stat(path) ~= nil
end

M.fexists = function(nombre_archivo)
	local file = io.open(nombre_archivo, 'r')
	if file then
		file:close()
		return true
	else
		return false
	end
end

return M
