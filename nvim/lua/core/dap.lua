-- Crear el comando :DapStart para cargar e inicializar todo bajo demanda
vim.api.nvim_create_user_command('DapStart', function()
	-- 1. Cargar los paquetes opcionales desde pack/*/opt/
	vim.cmd('packadd nvim-dap')
	vim.cmd('packadd nvim-dap-go')
	vim.cmd('packadd nvim-dap-view')

	-- Requerir módulos
	local dap = require('dap')
	local dapgo = require('dap-go')
	local dapview = require('dap-view')

	-- Configurar íconos de la signcolumn
	vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'DapBreakpoint' })
	vim.fn.sign_define('DapBreakpointCondition', { text = '🟡', texthl = 'DapBreakpoint' })
	vim.fn.sign_define('DapStopped', { text = '󰐊', texthl = 'DapStopped', linehl = 'CursorLine' })

	-- Configurar extensiones
	dapgo.setup()
	dapview.setup({
		icons = {
			collapsed = '󰅂 ',
			disabled = '',
			disconnect = '',
			enabled = '',
			expanded = '󰅀 ',
			filter = '󰈲',
			negate = ' ',
			pause = '',
			play = '',
			run_last = '',
			step_back = '',
			step_into = '',
			step_out = '',
			step_over = '',
			terminate = '',
		},
		winbar = {
			sections = { 'watches', 'scopes', 'exceptions', 'breakpoints', 'threads', 'repl', 'console' },
		},
	})

	-- Abrir nvim-dap-view automáticamente al iniciar una sesión de depuración
	dap.listeners.after.event_initialized['dap-view-config'] = function()
		dapview.open()
	end
	dap.listeners.before.event_terminated['dap-view-config'] = function()
		dapview.close()
	end
	dap.listeners.before.event_exited['dap-view-config'] = function()
		dapview.close()
	end

	-- Mapear atajos de teclado tras la carga
	vim.keymap.set('n', '<F9>', dap.continue, { desc = 'DAP Continuar / Iniciar' })
	vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'DAP Step Over' })
	vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'DAP Step Into' })
	vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'DAP Step Out' })
	vim.keymap.set('n', '<F4>', dap.toggle_breakpoint, { desc = 'DAP Alternar Breakpoint' })
	vim.keymap.set('n', '<F3>', dapview.toggle, { desc = 'DAP Alternar Vista (nvim-dap-view)' })

	vim.notify('  nvim-dap y nvim-dap-view cargados correctamente.')
end, {})
