--        .&(            &@             /&,
--      &&&&(           @@@@@           /&&&@
--   ,&&& .&(         @@@@@@@@@         /&, %&&*
-- .&&    .&(       @@@@@@@@@@@@        /&,    &&,
-- .&     .&(      @@@@@@@@@@@@@@@      /&,     &,
-- .&     .&(    @@@@@@@@@@@@@@@@@@@    /&,     &,
-- .&     .&(  @@@@@@@@@@. @@@@@@@@@@.  /&,     &,
-- @&     .&( @@@@@@@@@@     @@@@@@@@@@ /&,     &,
-- &&     &&@@@@@@@@@@        %@@@@@@@@@@&&     &,
-- &&   &&&@@@@@@@@@@           @@@@@@@@@@@&&   &,
-- && %&&@@@@@@@@@@               @@@@@@@@@@&&% &,
-- .&&&@@@@@@@@@@%                 #@@@@@@@@@(&&&,
--    &@@@@@@@@@                     &@@@@@@@@@
--       @@@@@                        *@@@@@.
--         %#          NEOVIM           (&
--
--         Walter Fabián Rodríguez Salazar

vim.pack.add({
	'https://github.com/echasnovski/mini.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/MunifTanjim/nui.nvim',
	'https://github.com/lewis6991/gitsigns.nvim',
	'https://github.com/webhooked/kanso.nvim',
	'https://github.com/ibhagwan/fzf-lua',
	'https://github.com/neovim-treesitter/nvim-treesitter',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/nanozuki/tabby.nvim',
	'https://github.com/supermaven-inc/supermaven-nvim',
	'https://github.com/mhartington/formatter.nvim',
	'https://github.com/neovim-treesitter/treesitter-parser-registry',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/nvim-lua/lsp-status.nvim',
	'https://github.com/beauwilliams/statusline.lua',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/j-hui/fidget.nvim',

	-- Debug Adapter Protocol
	{ src = 'https://github.com/mfussenegger/nvim-dap', load = false },
	{ src = 'https://github.com/theHamsta/nvim-dap-virtual-text', load = false },
	{ src = 'https://github.com/igorlfs/nvim-dap-view', load = false },
	{ src = 'https://github.com/leoluz/nvim-dap-go', load = false },
	-- Java support
	{ src = 'https://github.com/mfussenegger/nvim-jdtls', load = false },
	{ src = 'https://github.com/JavaHello/spring-boot.nvim', load = false },
	-- Emmet
	{ src = 'https://github.com/mattn/emmet-vim', load = false },
})

local fn = require('core.fn')
require('core.options')
require('core.keymaps')
require('core.autocommands')
require('core.lsp')
require('plugins')
require('core.dap')

-- -----------------------------------------------------------------------------
-- Configuraciones personalizadas
-- Configuración de qry
local qry = require('tui.qry')
fn.keymap('x', '<leader>gr', function()
	qry.run(false)
end, { desc = 'Ejecutar consulta a qry' })
fn.keymap('x', '<leader>gx', function()
	qry.run(true)
end, { desc = 'Ejecutar consulta a qry - expandida' })
fn.keymap('n', '<leader>gs', function()
	qry.select()
end, { desc = 'Seleccionar conexión a qry' })

-- MiniIntro
require('tui.miniintro').setup()
-- -----------------------------------------------------------------------------
