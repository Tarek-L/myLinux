return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
		{ "L3MON4D3/LuaSnip" },
	},

	config = function()
		-- ASCII-style border for floating windows
		local border_style = {
			{ "+", "FloatBorder" },
			{ "-", "FloatBorder" },
			{ "+", "FloatBorder" },
			{ "|", "FloatBorder" },
			{ "+", "FloatBorder" },
			{ "-", "FloatBorder" },
			{ "+", "FloatBorder" },
			{ "|", "FloatBorder" },
		}

		-- Setup diagnostics appearance
		vim.diagnostic.config({
			float = { border = border_style },
			virtual_text = true,
			underline = true,
		})

		-- Setup nvim-cmp (completion)
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local luasnip = require("luasnip")

		local capabilities = cmp_lsp.default_capabilities()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
			}),
			window = {
				completion = {
					border = border_style,
					winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
				},
				documentation = {
					border = border_style,
					winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
				},
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
			},
		})

		-- Setup mason and LSPs
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"pyright",
				"cssls",
				"bashls",
			},
			handlers = {
				-- Default handler for most servers with telemetry disabled
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						settings = {
							telemetry = { enable = false },
						},
					})
				end,
				-- Lua-specific settings
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "LuaJIT" },
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								telemetry = { enable = false },
							},
						},
					})
				end,
			},
		})

		-- Keymaps when LSP attaches to a buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf }
				local map = vim.keymap.set
				map("n", "gd", vim.lsp.buf.definition, opts)
				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "<leader>lf", vim.lsp.buf.format, opts)
				map("n", "<leader>la", vim.lsp.buf.code_action, opts)
				map("n", "<leader>lr", vim.lsp.buf.rename, opts)
				map("n", "<leader>ld", vim.diagnostic.open_float, opts)
				map("n", "<leader>ln", vim.diagnostic.goto_next, opts)
				map("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
			end,
		})
	end,
}
