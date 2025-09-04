-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  -- {
  --   'rmagatti/auto-session',
  --   lazy = false,
  --
  --   ---enables autocomplete for opts
  --   ---@module "auto-session"
  --   ---@type AutoSession.Config
  --   opts = {
  --     suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  --     -- log_level = 'debug',
  --   },
  -- },
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
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = false,
    opts = {
      show_success_message = true,
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      vim.wo.winfixbuf = false
      -- REQUIRED

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'Harpoon add file' })
      vim.keymap.set('n', '<leader>he', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon quick menu' })

      vim.keymap.set('n', '<leader>h1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon to file 1' })
      vim.keymap.set('n', '<leader>h2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon to file 2' })
      vim.keymap.set('n', '<leader>h3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon to file 3' })
      vim.keymap.set('n', '<leader>h4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon to file 4' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<leader>hp', function()
        harpoon:list():prev()
      end, { desc = 'Harpoon previous' })
      vim.keymap.set('n', '<leader>hn', function()
        harpoon:list():next()
      end, { desc = 'Harpoon next' })
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = true
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    lazy = false,
    keys = {
      -- Move to previous/next
      { '<C-,>', '<Cmd>BufferPrevious<CR>', desc = 'Go to previous buffer' },
      { '<C-.>', '<Cmd>BufferNext<CR>', desc = 'Go to next buffer' },

      -- Re-order to previous/next
      { '<C-<>', '<Cmd>BufferMovePrevious<CR>', desc = 'Move buffer previous' },
      { '<C->>', '<Cmd>BufferMoveNext<CR>', desc = 'Move buffer next' },

      -- Goto buffer in position...
      { '<C-1>', '<Cmd>BufferGoto 1<CR>', desc = 'Go to buffer 1' },
      { '<C-2>', '<Cmd>BufferGoto 2<CR>', desc = 'Go to buffer 2' },
      { '<C-3>', '<Cmd>BufferGoto 3<CR>', desc = 'Go to buffer 3' },
      { '<C-4>', '<Cmd>BufferGoto 4<CR>', desc = 'Go to buffer 4' },
      { '<C-5>', '<Cmd>BufferGoto 5<CR>', desc = 'Go to buffer 5' },
      { '<C-6>', '<Cmd>BufferGoto 6<CR>', desc = 'Go to buffer 6' },
      { '<C-7>', '<Cmd>BufferGoto 7<CR>', desc = 'Go to buffer 7' },
      { '<C-8>', '<Cmd>BufferGoto 8<CR>', desc = 'Go to buffer 8' },
      { '<C-9>', '<Cmd>BufferGoto 9<CR>', desc = 'Go to buffer 9' },
      { '<C-0>', '<Cmd>BufferLast<CR>', desc = 'Go to last buffer' },

      -- Pin/unpin buffer
      { '<C-p>', '<Cmd>BufferPin<CR>', desc = 'Pin buffer' },

      -- Close buffer
      { '<C-c>', '<Cmd>BufferClose<CR>', desc = 'Close buffer' },

      -- Magic buffer-picking mode
      { '<C-p>', '<Cmd>BufferPick<CR>', desc = 'Pick a buffer' },

      -- Sort automatically by...
      { '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', desc = 'Sort by buffer number' },
      { '<Space>bn', '<Cmd>BufferOrderByName<CR>', desc = 'Sort by name' },
      { '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', desc = 'Sort by directory' },
      { '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', desc = 'Sort by language' },
      { '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', desc = 'Sort by window' },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'jake-stewart/multicursor.nvim',
    branch = '1.0',
    config = function()
      local mc = require 'multicursor-nvim'
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      set({ 'n', 'x' }, '<up>', function()
        mc.lineAddCursor(-1)
      end)
      set({ 'n', 'x' }, '<down>', function()
        mc.lineAddCursor(1)
      end)
      set({ 'n', 'x' }, '<leader><up>', function()
        mc.lineSkipCursor(-1)
      end)
      set({ 'n', 'x' }, '<leader><down>', function()
        mc.lineSkipCursor(1)
      end)

      -- Add or skip adding a new cursor by matching word/selection
      set({ 'n', 'x' }, '<leader>n', function()
        mc.matchAddCursor(1)
      end)
      set({ 'n', 'x' }, '<leader>s', function()
        mc.matchSkipCursor(1)
      end)
      set({ 'n', 'x' }, '<leader>N', function()
        mc.matchAddCursor(-1)
      end)
      set({ 'n', 'x' }, '<leader>S', function()
        mc.matchSkipCursor(-1)
      end)

      -- Add and remove cursors with control + left click.
      set('n', '<c-leftmouse>', mc.handleMouse)
      set('n', '<c-leftdrag>', mc.handleMouseDrag)
      set('n', '<c-leftrelease>', mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ 'n', 'x' }, '<c-q>', mc.toggleCursor)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ 'n', 'x' }, '<left>', mc.prevCursor)
        layerSet({ 'n', 'x' }, '<right>', mc.nextCursor)

        -- Delete the main cursor.
        layerSet({ 'n', 'x' }, '<leader>x', mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet('n', '<esc>', function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, 'MultiCursorCursor', { reverse = true })
      hl(0, 'MultiCursorVisual', { link = 'Visual' })
      hl(0, 'MultiCursorSign', { link = 'SignColumn' })
      hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
      hl(0, 'MultiCursorDisabledCursor', { reverse = true })
      hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
      hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
      -- 'ibhagwan/fzf-lua', -- optional
      -- 'echasnovski/mini.pick', -- optional
      -- 'folke/snacks.nvim', -- optional
    },
  },
  {
    'kevinhwang91/nvim-bqf',
    opts = {},
  },
}
