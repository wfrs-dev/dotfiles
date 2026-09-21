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

-- local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
-- local usercmd = vim.api.nvim_create_user_command
local keymap = vim.keymap.set
-- local uv = vim.loop
-- local cwd = vim.getcwd

vim.pack.add({
	"https://github.com/beauwilliams/statusline.lua",
	"https://github.com/webhooked/kanso.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/zk-org/zk-nvim",
})

-- ##################################################################
-- # OPTIONS
-- ##################################################################

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.o.hlsearch = true
vim.wo.number = true
vim.o.mouse = ""
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.wo.signcolumn = "yes"
vim.wo.conceallevel = 0
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.o.listchars = "tab:┊ ,trail:~,extends:❯,precedes:❮,space:·,nbsp:§,multispace:·"
vim.o.list = true
vim.o.magic = true
vim.o.wrap = false
vim.o.title = true
vim.o.undofile = true
vim.o.formatoptions = "cq"
vim.o.showtabline = 0
vim.o.textwidth = 130
vim.o.wrapmargin = 130
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.wildmenu = true
vim.o.wildoptions = "pum"
vim.o.winborder = "double"
vim.o.grepprg = "rg --vimgrep --smart-case --hidden --follow -g '!{.git,node_modules}/*'"
vim.o.cmdheight = 0

vim.api.nvim_set_hl(0, "Pmenu", { bg = "#e6e6e6" })
vim.api.nvim_set_hl(0, "PmenuKind", { bg = "#e6e6e6" })
vim.api.nvim_set_hl(0, "PmenuExtra", { bg = "#e6e6e6" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#444444" })

-- ##################################################################
-- # KEYMAPS
-- ##################################################################

keymap("i", "<Tab>", function()
	if vim.pumvisible() ~= 0 then
		return "<C-n>" -- Next item
	end
	return "<Tab>" -- Insert tab
end, { expr = true })

keymap("i", "<S-Tab>", function()
	if vim.pumvisible() ~= 0 then
		return "<C-p>" -- Previous item
	end
	return "<S-Tab>" -- Insert shift-tab
end, { expr = true })

-- Ajuste de tecla <leader>
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- Guardar / Salir
keymap("n", "<leader><leader>w", "<cmd>w!<CR>", { desc = "Guardar buffer" })
keymap("n", "<leader><leader>W", "<cmd>wall!<CR>", { desc = "Guardar todos los buffers" })
keymap("n", "<leader><leader>q", "<cmd>q!<CR>", { desc = "Salir buffer" })
keymap("n", "<leader><leader>Q", "<cmd>qall!<CR>", { desc = "Salir de todos los buffers" })
keymap("n", "<leader><leader>x", "<cmd>x!<CR>", { desc = "Guardar y salir buffer" })
keymap("n", "<leader><leader>X", "<cmd>xall!<CR>", { desc = "Guardar y salir de todos los buffers" })
-- Mejor visualización en la búsqueda
keymap("n", "n", "nzzzv", { desc = "Buscar siguiente y centrar" })
keymap("n", "N", "Nzzzv", { desc = "Buscar anterior y centrar" })
keymap("n", "g,", "g,zvzz", { desc = "Siguiente posición en el listado de saltos" })
keymap("n", "g;", "g;zvzz", { desc = "Anterior posición en el listado de saltos" })
-- Mejor desplazamiento
keymap("n", "<C-d>", "<C-d>zz", { desc = "Página abajo y centrar" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Página arriba y centrar" })
-- Mejor manejo de la tecla escape
keymap("n", "<Esc>", "<cmd>nohl<CR>", { desc = "Limpiar el highlight en modo normal" })
keymap("n", "<C-[>", "<cmd>nohl<CR>", { desc = "Combinación alternativa a <Esc>" })
keymap("t", "<C-[>", "<C-\\><C-n>", { desc = "<Esc> en modo terminal" })
-- Movimientos entre buffers
keymap("n", "<C-r>", "<C-w>h", { desc = "Ir al buffer de la izquierda" })
keymap("n", "<C-t>", "<C-w>j", { desc = "Ir al buffer superior" })
keymap("n", "<C-n>", "<C-w>k", { desc = "Ir al buffer inferior" })
keymap("n", "<C-s>", "<C-w>l", { desc = "Ir al buffer de la derecha" })
keymap("n", "<C-h>", "<cmd>bp<CR>", { desc = "Buffer siguiente" })
keymap("n", "<C-l>", "<cmd>bn<CR>", { desc = "Buffer anterior" })
keymap("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Borrar buffer" })
keymap("n", "<leader><leader>bd", "<cmd>bd!<CR>", { desc = "Borrar buffer sin confirmación" })
-- Identación
keymap("v", "<", "<gv", { desc = "Indentar a la izquierda" })
keymap("v", ">", ">gv", { desc = "Indentar a la derecha" })
-- Pegar sobre el texto actualmente seleccionado sin copiarlo
keymap("v", "p", '"_dP')
-- Copiar desde el cursor hasta el final de línea
keymap("n", "Y", "y$")
-- X clipboard
keymap("x", "<leader>cy", '"+y', { desc = "Copiar al portapapeles" })
keymap("n", "<leader>cp", '"+p', { desc = "Pegar desde el portapapeles" })
keymap("n", "<leader>cP", '"+P', { desc = "Pegar antes de desde el portapapeles" })
-- Insertar líneas en blanco
keymap("n", "<leader>]", "o<Esc>", { desc = "Insertar línea siguiente" })
keymap("n", "<leader>[", "O<Esc>", { desc = "Insertar línea anterior" })
-- Deshacer / Rehacer
keymap("n", "<leader>(", ":undo<CR>", { desc = "Deshacer" })
keymap("n", "<leader>)", ":redo<CR>", { desc = "Rehacer" })
-- Zoom ventanas
keymap("n", "<leader><leader>m", "<C-w>_<C-w>|", { desc = "Zoom al máximo" })
keymap("n", "<leader><leader>e", "<C-w>=", { desc = "Restaurar todas las ventanas" })
keymap("n", "<leader><leader>a", "<C-w>r", { desc = "Intercambiar ventanas" })
-- Quickfix
keymap("n", "<M-o>", "<cmd>copen<CR>", { desc = "Abrir quickfix" })
keymap("n", "<M-c>", "<cmd>cclose<CR>", { desc = "Cerrar quickfix" })
keymap("n", "<M-l>", "<cmd>cnext<CR>", { desc = "Siguiente elemento de quickfix" })
keymap("n", "<M-h>", "<cmd>cprevious<CR>", { desc = "Anterior elemento de quickfix" })
keymap("n", "<M-0>", "<cmd>cfirst<CR>", { desc = "Primer elemento de quickfix" })
keymap("n", "<M-$>", "<cmd>clast<CR>", { desc = "Último elemento de quickfix" })
-- Ripgrep
keymap("n", "<leader>rg", ":silent grep! ", { noremap = true, desc = "Buscar con rg" })

-- ### MOVIMIENTOS DVORAK LDVD
-- Modo normal
keymap("n", "<M-r>", "h")
keymap("n", "<M-t>", "j")
keymap("n", "<M-n>", "k")
keymap("n", "<M-s>", "l")
-- Modo visual
keymap("x", "<M-r>", "h")
keymap("x", "<M-t>", "j")
keymap("x", "<M-n>", "k")
keymap("x", "<M-s>", "l")
-- Modo insertar
keymap("i", "<M-r>", "<Left>")
keymap("i", "<M-t>", "<Down>")
keymap("i", "<M-n>", "<Up>")
keymap("i", "<M-s>", "<Right>")
-- Modo terminal
keymap("t", "<C-r>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-t>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-n>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-s>", "<C-\\><C-n><C-w>l")

-- ##################################################################
-- # AUTOCOMMANDS
-- ##################################################################

-- Mostrar texto copiado
-- See `:help vim.highlight.on_yank()`
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	pattern = "*",
})

-- Configuracion de ventana de quickfix
autocmd("FileType", {
	pattern = { "quickfix" },
	callback = function()
		vim.cmd("setlocal nolist")
		vim.cmd("setlocal nonumber")
		vim.cmd("setlocal cursorline")
	end,
})

-- Auto-abrir quickfix si hay resultados y cerrarla si está vacía
autocmd("QuickFixCmdPost", {
	pattern = "*grep*",
	callback = function()
		vim.cmd("cwindow")
		if vim.empty(vim.filter(vim.getqflist(), "v:val.valid")) == 1 then
			vim.cmd("cclose")
		end
	end,
})

autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- No comentar nuevas líneas
autocmd("BufEnter", {
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- ##################################################################
-- # PLUGINS
-- ##################################################################

-- statusline
require("statusline").setup({
	match_colorscheme = false, -- Enable colorscheme inheritance (Default: false)
	tabline = true, -- Enable the tabline (Default: true)
	lsp_diagnostics = true, -- Enable Native LSP diagnostics (Default: true)
	ale_diagnostics = false, -- Enable ALE diagnostics (Default: false)
})

-- FZF-lua
local fzf = require("fzf-lua")
fzf.setup({
	fzf_colors = true,
	files = {
		no_ignore = false,
		follow = false,
	},
})
fzf.register_ui_select()
keymap("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Archivos" })
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
keymap("n", "<leader>fh", "<cmd>FzfLua oldfiles<CR>", { desc = "Archivos recientes" })
keymap("n", "<leader>fl", "<cmd>FzfLua blines<CR>", { desc = "Líneas en el buffer" })
keymap("n", "<leader>fs", "<cmd>FzfLua live_grep<CR>", { desc = "Buscar" })
keymap("n", "<leader>fm", "<cmd>FzfLua marks<CR>", { desc = "Marcas" })
keymap("n", "<leader>fj", "<cmd>FzfLua jumps<CR>", { desc = "Saltos" })

-- kanso
require("kanso").setup()
vim.cmd("colorscheme kanso-pearl")

-- zk
local zk = require("zk")

zk.setup({
	-- Configuración del LSP
	lsp = {
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
		},
		-- Iniciar LSP automáticamente en markdowns
		auto_attach = {
			enabled = true,
			filetypes = { "markdown" },
		},
	},
})
