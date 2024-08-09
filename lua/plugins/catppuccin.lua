return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "auto",   -- latte, frappe, macchiato, mocha
      background = {    -- :set background=light/dark
        light = "latte",
        dark = "mocha",
      },
      -- transparent_background = true, -- disables setting the background color.
      -- styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      --     comments = { "italic" }, -- Change the style of comments
      --     conditionals = { "italic" },
      --     loops = {},
      --     keywords = {},
      --     booleans = {},
      -- },
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
