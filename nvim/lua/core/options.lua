vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.o.hlsearch = true
vim.wo.number = true
vim.o.mouse = ''
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.wo.signcolumn = 'yes'
vim.wo.conceallevel = 0
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.listchars = 'tab:┊ ,trail:~,extends:❯,precedes:❮,space:·,nbsp:§,multispace:·'
vim.o.list = true
vim.o.magic = true
vim.o.wrap = false
vim.o.title = true
vim.o.undofile = true
vim.o.formatoptions = 'cq'
vim.o.showtabline = 0
vim.o.textwidth = 130
vim.o.wrapmargin = 130
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.wildmenu = true
vim.o.wildoptions = 'pum'
vim.o.winborder = 'double'
vim.o.grepprg = 'rg --vimgrep --smart-case --hidden --follow -g \'!{.git,node_modules}/*\''
vim.o.cmdheight = 0
-- Local nvim config
-- Busca .nvim.lua en la raíz del proyecto
vim.o.exrc = true
vim.o.secure = true

local fn = require('core.fn')
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'PmenuKind', { bg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'PmenuExtra', { bg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#444444' })

fn.keymap('i', '<Tab>', function()
	if vim.fn.pumvisible() ~= 0 then
		return '<C-n>' -- Next item
	end
	return '<Tab>' -- Insert tab
end, { expr = true })

fn.keymap('i', '<S-Tab>', function()
	if vim.fn.pumvisible() ~= 0 then
		return '<C-p>' -- Previous item
	end
	return '<S-Tab>' -- Insert shift-tab
end, { expr = true })
