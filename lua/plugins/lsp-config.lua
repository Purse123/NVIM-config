return {
  {
    -- it is the lsp server we use
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- it act as a bridge between lsp and nvim
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        --[[
        ensure_installed = {
          "lua_ls", -- for lua
          "tsserver", -- for .ts js
          "clangd", -- for c/c++
          "html", -- for html
          "eslint_d", -- linter for js/ts
          "cpplint", -- linter for c/c++
        },
        ]]
        auto_install = true,
      })
    end,
  },
  {
    -- plugin to configure neovim to language server
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({ capabilities = capabilities, cmd = { "clangd", "--enable-config", "--clang-tidy" },
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      -- all the vim.lsp.buf.'...' are the function which send signal to lsp attached
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
