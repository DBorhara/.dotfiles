-- ftplugin/java.lua  — nvim-jdtls + Mason, Neovim 0.11+

-- Defer a tick so plugin managers (lazy.nvim, etc.) finish loading nvim-jdtls
vim.schedule(function()
	local function note(msg, lvl)
		vim.notify('[jdtls] ' .. msg, lvl or vim.log.levels.INFO)
	end

	local ok, jdtls = pcall(require, 'jdtls')
	if not ok then
		note(
			'nvim-jdtls not available (is the plugin installed and loaded on FileType=java?)',
			vim.log.levels.ERROR
		)
		return
	end

	-- already attached to this buffer?
	if next(vim.lsp.get_clients({ bufnr = 0, name = 'jdtls' })) then
		return
	end

	-- find root (fallback to file's dir -> good for single-file assignments)
	local bufpath = vim.api.nvim_buf_get_name(0)
	if bufpath == '' then
		return
	end
	local markers = { 'mvnw', 'gradlew', 'pom.xml', 'build.gradle', '.git' }
	local hit = vim.fs.find(markers, { upward = true, path = bufpath })[1]
	local root = hit and vim.fs.dirname(hit) or vim.fs.dirname(bufpath)
	if not root or root == '' then
		return
	end

	-- per-project workspace (required by JDT LS)
	local data = vim.fn.stdpath('data')
	local ws = data .. '/jdtls/workspace/' .. vim.fs.basename(root)
	vim.fn.mkdir(ws, 'p')

	-- LSP capabilities (blink.cmp -> cmp -> defaults)
	local caps = (function()
		local okb, blink = pcall(require, 'blink.cmp')
		if okb then
			return blink.get_lsp_capabilities()
		end
		local okc, cmp = pcall(require, 'cmp_nvim_lsp')
		if okc then
			return cmp.default_capabilities()
		end
		return vim.lsp.protocol.make_client_capabilities()
	end)()

	-- If a client for this root already exists, just attach this buffer to it
	for _, c in ipairs(vim.lsp.get_clients({ name = 'jdtls' })) do
		if c.config and c.config.root_dir == root then
			vim.lsp.buf_attach_client(0, c.id)
			note(
				('attached buffer to existing client %d (root=%s)'):format(
					c.id,
					root
				)
			)
			return
		end
	end

	-- Start jdtls *in this buffer’s context* so it actually attaches here
	local cfg = {
		cmd = { data .. '/mason/bin/jdtls', '-data', ws },
		root_dir = root,
		capabilities = caps,
		settings = {
			java = {
				configuration = { updateBuildConfiguration = 'interactive' },
				format = { enabled = true },
			},
		},
	}

	vim.api.nvim_buf_call(0, function()
		jdtls.start_or_attach(cfg)
		pcall(jdtls.setup_dap, { hotcodereplace = 'auto' }) -- optional
		pcall(jdtls.setup.add_commands) -- optional
	end)

	-- confirm attachment
	vim.defer_fn(function()
		local clients = vim.lsp.get_clients({ bufnr = 0, name = 'jdtls' })
		if #clients > 0 then
			note(('attached client %d (root=%s)'):format(clients[1].id, root))
		else
			note(
				'started but not attached; check :LspInfo / :messages',
				vim.log.levels.WARN
			)
		end
	end, 100)
end)
