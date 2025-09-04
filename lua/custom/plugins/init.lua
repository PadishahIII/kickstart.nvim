-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },
  {
    'nvim-telescope/telescope-project.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      direction = 'horizontal', -- Open a split at the bottom
      -- direction = 'float', -- Use a floating window
      open_mapping = [[<c-\>]], -- The key to open the terminal
      shell = vim.o.shell, -- Use your default shell
    },
  },
  {
    'augmentcode/augment.vim',
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      -- Call the setup function as provided in the documentation
      require('aerial').setup {
        -- This function sets keymaps only for buffers where aerial is active
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr, silent = true, desc = 'Prev symbol' })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr, silent = true, desc = 'Next symbol' })
        end,
      }

      -- You can set your global keymap to toggle aerial here
      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>', { desc = 'Toggle Aerial' })
    end,
  },
}
