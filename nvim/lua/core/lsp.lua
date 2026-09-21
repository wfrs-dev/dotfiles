local cmp = require('mini.completion')
local fn = require('core.fn')

--------------------------------------------------------------------------------
-- LSP Attach
--------------------------------------------------------------------------------

fn.autocmd('LspAttach', {
	desc = 'LSP Actions',
	callback = function(event)
		local opts = {
			buffer = event.buf,
			silent = true,
		}

		fn.keymap(
			'n',
			'gm',
			vim.diagnostic.open_float,
			vim.tbl_extend('force', opts, {
				desc = 'Mostrar diagnóstico',
			})
		)

		fn.keymap(
			'n',
			'gn',
			vim.diagnostic.goto_prev,
			vim.tbl_extend('force', opts, {
				desc = 'Diagnóstico anterior',
			})
		)

		fn.keymap(
			'n',
			'gp',
			vim.diagnostic.goto_next,
			vim.tbl_extend('force', opts, {
				desc = 'Diagnóstico siguiente',
			})
		)

		fn.keymap(
			'n',
			'gl',
			vim.diagnostic.setloclist,
			vim.tbl_extend('force', opts, {
				desc = 'Lista de diagnósticos',
			})
		)

		fn.keymap(
			'n',
			'g$',
			vim.diagnostic.setqflist,
			vim.tbl_extend('force', opts, {
				desc = 'Quickfix diagnósticos',
			})
		)

		fn.keymap('i', '<C-Space>', '<C-x><C-o>', opts)

		fn.keymap(
			'n',
			'K',
			vim.lsp.buf.hover,
			vim.tbl_extend('force', opts, {
				desc = 'Hover',
			})
		)

		fn.keymap(
			'n',
			'gd',
			vim.lsp.buf.definition,
			vim.tbl_extend('force', opts, {
				desc = 'Ir a definición',
			})
		)

		fn.keymap(
			'n',
			'gD',
			vim.lsp.buf.declaration,
			vim.tbl_extend('force', opts, {
				desc = 'Ir a declaración',
			})
		)

		fn.keymap(
			'n',
			'gi',
			vim.lsp.buf.implementation,
			vim.tbl_extend('force', opts, {
				desc = 'Implementaciones',
			})
		)

		fn.keymap(
			'n',
			'go',
			vim.lsp.buf.type_definition,
			vim.tbl_extend('force', opts, {
				desc = 'Definición de tipo',
			})
		)

		fn.keymap(
			'n',
			'gr',
			vim.lsp.buf.references,
			vim.tbl_extend('force', opts, {
				desc = 'Referencias',
			})
		)

		fn.keymap(
			'n',
			'<C-k>',
			vim.lsp.buf.signature_help,
			vim.tbl_extend('force', opts, {
				desc = 'Firma',
			})
		)

		fn.keymap(
			'n',
			'gw',
			vim.lsp.buf.rename,
			vim.tbl_extend('force', opts, {
				desc = 'Renombrar',
			})
		)

		fn.keymap(
			'n',
			'gz',
			vim.lsp.buf.code_action,
			vim.tbl_extend('force', opts, {
				desc = 'Code Action',
			})
		)
	end,
})

--------------------------------------------------------------------------------
-- Mini Completion
--------------------------------------------------------------------------------

cmp.setup({
	delay = {
		completion = 100,
		info = 100,
		signature = 100,
	},

	window = {
		info = {
			border = 'rounded',
		},

		signature = {
			border = 'rounded',
		},
	},
})

require('mini.icons').tweak_lsp_kind()

--------------------------------------------------------------------------------
-- Diagnostics
--------------------------------------------------------------------------------

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	severity_sort = true,
	update_in_insert = false,

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '',
			[vim.diagnostic.severity.WARN] = '󱈸',
			[vim.diagnostic.severity.INFO] = '',
			[vim.diagnostic.severity.HINT] = '',
		},
	},

	float = {
		border = 'rounded',
		source = 'always',
	},
})

--------------------------------------------------------------------------------
-- Ignore INFO messages from LSP servers
--------------------------------------------------------------------------------

local default_handler = vim.lsp.handlers['window/showMessage']

vim.lsp.handlers['window/showMessage'] = function(err, result, ctx, config)
	if result and result.type > 2 then
		return
	end

	return default_handler(err, result, ctx, config)
end

--------------------------------------------------------------------------------
-- Global configuration
--------------------------------------------------------------------------------

vim.lsp.config('*', {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})

--------------------------------------------------------------------------------
-- Lua LS
--------------------------------------------------------------------------------

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
				disable = { 'missing-fields' },
			},

			workspace = {
				checkThirdParty = false,
			},

			telemetry = {
				enable = false,
			},
		},
	},
})

--------------------------------------------------------------------------------
-- Go
--------------------------------------------------------------------------------

vim.lsp.config('gopls', {
	settings = {
		gopls = {
			staticcheck = true,
			gofumpt = true,
			usePlaceholders = true,
			analyses = {
				ST1000 = false, -- Comentarios documentales en funciones/tipos exportados
			},
			-- ui = {
			-- 	diagnostic = {
			-- 		suppress = {
			-- 			'ST1000',
			-- 		},
			-- 	},
			-- },
		},
	},
})

--------------------------------------------------------------------------------
-- Java
--------------------------------------------------------------------------------

vim.lsp.config('jdtls', {})

--------------------------------------------------------------------------------
-- Progress
--------------------------------------------------------------------------------

vim.lsp.progress = {
	enabled = false,
}

--------------------------------------------------------------------------------
-- Enable servers
--------------------------------------------------------------------------------

vim.lsp.enable({
	'lua_ls',
	'gopls',
	'jdtls',
})
