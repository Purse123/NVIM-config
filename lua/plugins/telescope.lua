return{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-t>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      -- to use live_grep u need to install another package ripgrep
      -- run {sudo apt-get install ripgrep} for debian
    end
  },
  {
    -- for code_action ui
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      -- here we are adding extension to telescope for our UI select plugin
      require("telescope").setup ({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
          }
        }
      })
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  }
}
