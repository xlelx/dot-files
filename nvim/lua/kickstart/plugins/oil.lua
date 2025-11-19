return {
  {
    'stevearc/oil.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory here' })
      vim.keymap.set('n', '<space>-', require('oil').toggle_float, { desc = 'Open parent directory in floating window' })
    end,
  },
}
