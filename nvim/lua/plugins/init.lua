local fn = require('core.fn')

-- Mini.nvim
local miniclue = require('mini.clue')
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = 'n', keys = '<Leader>' },
		{ mode = 'x', keys = '<Leader>' },
		-- Built-in completion
		{ mode = 'i', keys = '<C-x>' },
		-- `g` key
		{ mode = 'n', keys = 'g' },
		{ mode = 'x', keys = 'g' },
		-- Marks
		{ mode = 'n', keys = '\'' },
		{ mode = 'n', keys = '`' },
		{ mode = 'x', keys = '\'' },
		{ mode = 'x', keys = '`' },
		-- Registers
		{ mode = 'n', keys = '"' },
		{ mode = 'x', keys = '"' },
		{ mode = 'i', keys = '<C-r>' },
		{ mode = 'c', keys = '<C-r>' },
		-- Window commands
		{ mode = 'n', keys = '<C-w>' },
		-- `z` key
		{ mode = 'n', keys = 'z' },
		{ mode = 'x', keys = 'z' },
	},
	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
	window = {
		delay = 300,
		config = {
			anchor = 'SW',
			width = 'auto',
			col = 'auto',
			row = 'auto',
		},
	},
})
require('mini.icons').setup()
require('mini.jump2d').setup()
require('mini.pairs').setup()
require('mini.splitjoin').setup()
require('mini.completion').setup()
require('mini.notify').setup()
vim.notify = require('mini.notify').make_notify()

-- fidget notifications
-- local fidget = require('fidget')
-- fidget.setup({
-- 	notification = {
-- 		override_vim_notify = true,
-- 		view = {
-- 			group_separator_hl = 'String',
-- 		},
-- 	},
-- })

-- gitsigns
require('gitsigns').setup({ current_line_blame = true })
fn.keymap('n', '<leader>gb', '<cmd>Gitsigns blame<CR>', { desc = 'Git blame' })
vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#80beaf', italic = true })

-- kanso
require('kanso').setup()
vim.cmd('colorscheme kanso-pearl')

--treesitter
require('nvim-treesitter').setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
})
-- vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- folds
-- vim.o.foldmethod = 'expr'
-- vim.o.indentexpr = 'v:lua.require\'nvim-treesitter\'.indentexpr()' -- indentation

-- FZF-lua
local fzf = require('fzf-lua')
fzf.setup({
	fzf_colors = true,
	files = {
		prompt = 'Files❯ ',
		no_ignore = true,
		follow = false,
	},
	tags = {
		prompt = 'Tags❯ ',
		ctags_file = nil, -- auto-detect from tags-option
		multiprocess = true,
		file_icons = true,
		color_icons = true,
		-- 'tags_live_grep' options, `rg` prioritizes over `grep`
		rg_opts = '--no-heading --color=always --smart-case',
		grep_opts = '--color=auto --perl-regexp',
		fzf_opts = { ['--tiebreak'] = 'begin' },
	},
	btags = {
		prompt = 'BTags❯ ',
		ctags_file = nil, -- auto-detect from tags-option
		ctags_autogen = true, -- dynamically generate ctags each call
		multiprocess = true,
		file_icons = false,
		rg_opts = '--color=never --no-heading',
		grep_opts = '--color=never --perl-regexp',
		fzf_opts = { ['--tiebreak'] = 'begin' },
	},
})
fzf.register_ui_select()
fn.keymap('n', '<leader>ff', '<cmd>FzfLua files<CR>', { desc = 'Archivos' })
fn.keymap('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', { desc = 'Buffers' })
fn.keymap('n', '<leader>fh', '<cmd>FzfLua oldfiles<CR>', { desc = 'Archivos recientes' })
fn.keymap('n', '<leader>fl', '<cmd>FzfLua blines<CR>', { desc = 'Líneas en el buffer' })
fn.keymap('n', '<leader>fs', '<cmd>FzfLua live_grep<CR>', { desc = 'Buscar' })
fn.keymap('n', '<leader>fc', '<cmd>FzfLua git_commits<CR>', { desc = 'Commits en el repositorio git' })
fn.keymap('n', '<leader>fa', '<cmd>FzfLua help_tags<CR>', { desc = 'Ayuda de Neovim' })
fn.keymap('n', '<leader>fm', '<cmd>FzfLua marks<CR>', { desc = 'Marcas' })
fn.keymap('n', '<leader>fj', '<cmd>FzfLua jumps<CR>', { desc = 'Saltos' })
fn.keymap('n', '<leader>ft', '<cmd>FzfLua btags<CR>', { desc = 'Tags del buffer' })

-- Oil.nvim
require('oil').setup()
fn.keymap('n', '<leader>oo', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- tabby
vim.o.showtabline = 1
local theme = {
	current_tab = { fg = '#595959', bg = '#f0f0f0', style = 'bold' },
	tab = { fg = '#a6a6a6', bg = '#f0f0f0' },
	current_buf = { fg = '#6ebbeb', bg = '#f0f0f0', style = 'bold' },
	buf = { fg = '#bfbfbf', bg = '#f0f0f0' },
	fill = { bg = '#f0f0f0' },
}
require('tabby').setup({
	line = function(line)
		return {
			{
				{ '  ', hl = theme.current_tab },
				line.sep('  ', theme.fill, theme.fill),
			},
			line.tabs().foreach(function(tab)
				local hl = tab.is_current() and theme.current_tab or theme.tab
				return {
					tab.is_current() and ' ' or ' ',
					tab.number(),
					line.sep(' ', hl, theme.fill),
					hl = hl,
					margin = ' ',
				}
			end),
			line.spacer(),
			line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
				local hl = win.is_current() and theme.current_buf or theme.buf
				return {
					line.sep(' ', hl, theme.fill),
					win.is_current() and '󱔀 ' or '󰝣 ',
					win.buf_name(),
					hl = hl,
				}
			end),
			{
				line.sep(' ', theme.fill, theme.fill),
				{ '  ', hl = theme.current_buf },
			},
			hl = theme.fill,
		}
	end,
})
fn.keymap('n', '<leader>t$', '<cmd>tablast<cr>', { desc = 'Ir a la última pestaña' })
fn.keymap('n', '<leader>t0', '<cmd>tabfirst<cr>', { desc = 'Ir a la primera pestaña' })
fn.keymap('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = 'Cerrar pestaña' })
fn.keymap('n', '<leader>ts', '<cmd>tabnew term://bash<cr>', { desc = 'Abrir terminal en una pestaña' })

-- supermaven
require('supermaven-nvim').setup({
	keymaps = {
		accept_suggestion = '<A-g>',
		clear_suggestion = '<A-b>',
		accept_word = '<A-f>',
	},
})

-- formatter
require('formatter').setup({
	logging = false,
	filetype = {
		lua = require('formatter.filetypes.lua').stylua,
		go = function()
			if fn.fexists(fn.cwd() .. '/.goimports') then
				return require('formatter.filetypes.go').goimports()
			end

			return {
				exe = 'golines',
				args = { '-m', 120, '--base-formatter="goimports"' },
				stdin = true,
			}
		end,
		javascript = require('formatter.filetypes.javascript').prettier,
		-- html = require('formatter.filetypes.html').prettier,
		-- css = require('formatter.filetypes.css').prettier,
		json = require('formatter.filetypes.json').jq,
		cs = require('formatter.filetypes.cs').csharpier,
		python = require('formatter.filetypes.python').ruff,
		latex = require('formatter.filetypes.latex').latexindent,
		tex = require('formatter.filetypes.latex').latexindent,
		rust = require('formatter.filetypes.rust').rustfmt,
		plaintex = require('formatter.filetypes.latex').latexindent,
		-- typescript = require('formatter.filetypes.typescript').prettier,
		xml = require('formatter.filetypes.xml').xmllint,
		java = function()
			return {
				exe = 'google-java-format',
				args = { '-' },
				stdin = true,
			}
		end,
		hjson = function()
			return {
				exe = 'hjson-cli',
				args = { '-preserveKeyOrder', '-bracesSameLine', '-quoteAlways' },
				stdin = true,
			}
		end,
		templ = function()
			return {
				exe = 'templ',
				args = { 'fmt' },
				stdin = true,
			}
		end,
		['*'] = {
			require('formatter.filetypes.any').remove_trailing_whitespace,
		},
	},
})

fn.augroup('__formatter__', { clear = true })
fn.autocmd('BufWritePost', {
	group = '__formatter__',
	command = ':FormatWrite',
})

-- statusline
require('statusline').setup({
	match_colorscheme = false, -- Enable colorscheme inheritance (Default: false)
	tabline = true, -- Enable the tabline (Default: true)
	lsp_diagnostics = true, -- Enable Native LSP diagnostics (Default: true)
	ale_diagnostics = false, -- Enable ALE diagnostics (Default: false)
})
