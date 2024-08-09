return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Keybinding setup
    vim.keymap.set('n', '<leader>tt', ':Neotree toggle<CR>', { desc = "Toggle Neotree" })

    require('neo-tree').setup({
      close_if_last_window = true,
      enable_git_status = true,
      with_markers = true,
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
      },
      window = {
        position = "left",
        width = 35,
      },
      filesystem = {
        follow_current_file = {
          enabled = true,  -- Follow the current file
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = true,
          hide_gitignored = false,
        },
      },
    })
  end
}
