local M = {}

local fn = require('core.fn')

M.setup = function()
	vim.g.user_emmet_leader_key = '<C-b>'
	vim.g.user_emmet_install_global = 0

	fn.autocmd('FileType', {
		pattern = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
		callback = function()
			vim.cmd.packadd('emmet-vim')
			vim.cmd('EmmetInstall')
		end,
	})
end

return M
