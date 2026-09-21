-- Asegurar que dap esté disponible
local ok, dap = pcall(require, 'dap')
if not ok then
	return
end

-- Sobrescribir o añadir configuraciones de depuración específicas para este proyecto
dap.configurations.go = {
	{
		type = 'go',
		name = 'Iniciar API (cmd/api)',
		request = 'launch',
		program = '${workspaceFolder}/cmd/api',
		args = { '-config', './config/dev.yaml' }, -- Argumentos de CLI específicos de este proyecto
		env = {
			PORT = '8080',
			DB_HOST = 'localhost',
		},
	},
	{
		type = 'go',
		name = 'Iniciar Worker (cmd/worker)',
		request = 'launch',
		program = '${workspaceFolder}/cmd/worker',
	},
}
