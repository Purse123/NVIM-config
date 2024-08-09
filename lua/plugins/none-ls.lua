return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim", -- for extra linters eslint_d, cpplint
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Formatter for Lua
        null_ls.builtins.formatting.stylua,

        -- Formatter for C/C++
        null_ls.builtins.formatting.clang_format,

        -- Formatter for JavaScript/TypeScript and other web-related files
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "css",
            "html",
            "javascript",
            "javascriptreact",
            -- "json",
            -- "markdown",
            -- "scss",
            -- "typescript",
            -- "typescriptreact",
          },
        }),

        -- Spell completion
        -- null_ls.builtins.completion.spell,

        -- Linter for JavaScript/TypeScript
        require("none-ls.diagnostics.eslint_d"), -- with nonels-extra

        -- Linter for C/C++
        -- require("none-ls.diagnostics.cpplint").with({ -- with nonels-extra
        --   filetypes = { "cpp", "c++" },
        -- }),
      },
    })

    -- Keybinding to format code
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
