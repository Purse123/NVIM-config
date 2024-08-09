return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp") --loads the nvim-cmp module and assigns it to the local variable
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args) -- when we expand the key when clicking the snippet it runs this function
						require("luasnip").lsp_expand(args.body) -- For `luasnip` other on github readme
					end,
				},
				window = { -- it is just how the style of auto completion window
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll up
					["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll down
					["<C-Space>"] = cmp.mapping.complete(), -- completing snippet
					["<C-e>"] = cmp.mapping.abort(), -- aborting snippet
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- conform snippet/ expanding
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- uses nvim LSP as a source for completion suggestion
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
					-- uses the current buffer as a source for completion suggestion
					-- this means it suggest word and phase already present in current file
				}),
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter", --triggered when on insert mode
		config = function()
			require("nvim-autopairs").setup({}) -- calls the setup function from the nvim-autopairs module
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = true,
				},
				-- Per filetype overrides
				per_filetype = {
					-- for HTML
					["html"] = {
						enable_close = true,
						enable_rename = true,
						enable_close_on_slash = true,
					},
					-- for JSX
					["javascriptreact"] = {
						enable_close = true,
						enable_rename = true,
						enable_close_on_slash = true,
					},
          -- for typescriptreact
					-- ["typescriptreact"] = {
					-- 	enable_close = true,
					-- 	enable_rename = true,
					-- 	enable_close_on_slash = true,
					-- },
				},
			})
		end,
	},
}
