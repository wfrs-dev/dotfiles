local M = {}

M.setup = function(springboot)
	vim.cmd.packadd('nvim-dap')
	vim.cmd.packadd('nvim-jdtls')
	if springboot then
		vim.cmd.packadd('spring-boot.nvim')
	end
	local home = os.getenv('HOME')
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
	local workspace_dir = home .. '/.cache/jdtls/workspace/' .. project_name

	local root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' })

	local has_spring_boot = false
	local spring_boot = {}
	local java_bundles = {}

	if springboot then
		has_spring_boot, spring_boot = pcall(require, 'spring_boot')
	end

	if has_spring_boot and root_dir then
		java_bundles = spring_boot.java_extensions()
	end

	local config = {
		cmd = {
			'/opt/jdtls/bin/jdtls',
			-- '-configuration',
			-- home .. '/.config/jdtls/config_linux',
			'-data',
			workspace_dir,
		},

		root_dir = root_dir,

		settings = {
			java = {
				signatureHelp = { enabled = true },
				contentProvider = { preferred = 'fernflower' },
				completion = {
					favoriteStaticMembers = {
						'org.hamcrest.MatcherAssert.assertThat',
						'org.junit.jupiter.api.Assertions.*',
						'java.util.Objects.requireNonNull',
						'org.mockito.Mockito.*',
					},
					filteredTypes = {
						'com.sun.*',
						'sun.*',
						'org.graalvm.*',
						'jdk.*',
					},
				},
				sources = {
					organizeImports = {
						starThreshold = 9999,
						staticStarThreshold = 9999,
					},
				},
			},
		},
		init_options = {
			bundles = java_bundles,
		},
	}

	if springboot then
		config.bundles = require('spring_boot').java_extensions()
	end
	local has_mini_completion, mini_completion = pcall(require, 'mini.completion')
	if has_mini_completion then
		-- Inyecta las capacidades nativas que mini.completion espera del LSP
		config.capabilities = mini_completion.get_lsp_capabilities()
	end

	config['on_attach'] = function(_, bufnr)
		local opts = { silent = true, buffer = bufnr }
		local jdtls = require('jdtls')

		vim.keymap.set('n', '<leader>co', jdtls.organize_imports, opts)
		vim.keymap.set('n', '<leader>rv', jdtls.extract_variable, opts)
		vim.keymap.set('v', '<leader>rv', function()
			jdtls.extract_variable(true)
		end, opts)
		vim.keymap.set('v', '<leader>rm', function()
			jdtls.extract_method(true)
		end, opts)
	end
	vim.lsp.config('jdtls', {
		handlers = {
			-- Disables JDTLS status spam messages
			['language/status'] = function(_, _) end,
			['$/progress'] = function() end,
			['textDocument/publishDiagnostics'] = function() end,
			['textDocument/diagnostic,'] = function() end,
		},
	})

	require('jdtls').start_or_attach(config)
end

return M
