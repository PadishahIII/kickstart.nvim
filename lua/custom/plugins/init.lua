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
    lazy = false,
    config = function()
      -- Call the setup function as provided in the documentation
      require('aerial').setup {
        -- This function sets keymaps only for buffers where aerial is active
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr, silent = true, desc = 'Prev symbol' })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr, silent = true, desc = 'Next symbol' })
        end,
        filter_kind = {
          'Array',
          -- 'Boolean',
          'Class',
          'Constant',
          'Constructor',
          'Enum',
          -- 'EnumMember',
          -- 'Event',
          -- 'Field',
          -- 'File',
          'Function',
          'Interface',
          -- 'Key',
          'Method',
          'Module',
          'Namespace',
          -- 'Null',
          -- 'Number',
          -- 'Object',
          -- 'Operator',
          -- 'Package',
          -- 'Property',
          -- 'String',
          'Struct',
          -- 'TypeParameter',
          -- 'Variable',
        },
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
      -- { '<>', '<Cmd>BufferPin<CR>', desc = 'Pin buffer' },

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
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          {
            pane = 2,
            section = 'terminal',
            -- cmd = 'colorscript -e square',
            height = 5,
            padding = 1,
          },
          { section = 'keys', gap = 1, padding = 1 },
          { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          {
            pane = 2,
            icon = ' ',
            title = 'Git Status',
            section = 'terminal',
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = 'git status --short --branch --renames',
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = 'startup' },
        },
      },
      explorer = { enabled = true, focus = 'input', auto_close = false, files = {
        hidden = true,
        ignored = true,
      } },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = { enabled = true, files = {
        hidden = true,
        ignored = true,
      } },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        },
      },
    },
    keys = {
      -- Top Pickers & Explorer
      {
        '<leader><space>',
        function()
          Snacks.picker.smart()
        end,
        desc = 'Smart Find Files',
      },
      {
        '<leader>,',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Buffers',
      },
      {
        '<leader>/',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Grep',
      },
      {
        '<leader>:',
        function()
          Snacks.picker.command_history()
        end,
        desc = 'Command History',
      },
      {
        '<leader>n',
        function()
          Snacks.picker.notifications()
        end,
        desc = 'Notification History',
      },
      {
        '<leader>e',
        function()
          Snacks.explorer()
        end,
        desc = 'File Explorer',
      },
      -- find
      {
        '<leader>fb',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Buffers',
      },
      {
        '<leader>fc',
        function()
          Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
        end,
        desc = 'Find Config File',
      },
      {
        '<leader>ff',
        function()
          Snacks.picker.files()
        end,
        desc = 'Find Files',
      },
      {
        '<leader>fg',
        function()
          Snacks.picker.git_files()
        end,
        desc = 'Find Git Files',
      },
      {
        '<leader>fp',
        function()
          Snacks.picker.projects()
        end,
        desc = 'Projects',
      },
      {
        '<leader>fr',
        function()
          Snacks.picker.recent()
        end,
        desc = 'Recent',
      },
      -- git
      {
        '<leader>gb',
        function()
          Snacks.picker.git_branches()
        end,
        desc = 'Git Branches',
      },
      {
        '<leader>gl',
        function()
          Snacks.picker.git_log()
        end,
        desc = 'Git Log',
      },
      {
        '<leader>gL',
        function()
          Snacks.picker.git_log_line()
        end,
        desc = 'Git Log Line',
      },
      {
        '<leader>gs',
        function()
          Snacks.picker.git_status()
        end,
        desc = 'Git Status',
      },
      {
        '<leader>gS',
        function()
          Snacks.picker.git_stash()
        end,
        desc = 'Git Stash',
      },
      {
        '<leader>gd',
        function()
          Snacks.picker.git_diff()
        end,
        desc = 'Git Diff (Hunks)',
      },
      {
        '<leader>gf',
        function()
          Snacks.picker.git_log_file()
        end,
        desc = 'Git Log File',
      },
      -- Grep
      {
        '<leader>sb',
        function()
          Snacks.picker.lines()
        end,
        desc = 'Buffer Lines',
      },
      {
        '<leader>sB',
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = 'Grep Open Buffers',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Grep',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = 'Visual selection or word',
        mode = { 'n', 'x' },
      },
      -- search
      {
        '<leader>s"',
        function()
          Snacks.picker.registers()
        end,
        desc = 'Registers',
      },
      {
        '<leader>s/',
        function()
          Snacks.picker.search_history()
        end,
        desc = 'Search History',
      },
      {
        '<leader>sa',
        function()
          Snacks.picker.autocmds()
        end,
        desc = 'Autocmds',
      },
      {
        '<leader>sb',
        function()
          Snacks.picker.lines()
        end,
        desc = 'Buffer Lines',
      },
      {
        '<leader>sc',
        function()
          Snacks.picker.command_history()
        end,
        desc = 'Command History',
      },
      {
        '<leader>sC',
        function()
          Snacks.picker.commands()
        end,
        desc = 'Commands',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = 'Diagnostics',
      },
      {
        '<leader>sD',
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = 'Buffer Diagnostics',
      },
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = 'Help Pages',
      },
      {
        '<leader>sH',
        function()
          Snacks.picker.highlights()
        end,
        desc = 'Highlights',
      },
      {
        '<leader>si',
        function()
          Snacks.picker.icons()
        end,
        desc = 'Icons',
      },
      {
        '<leader>sj',
        function()
          Snacks.picker.jumps()
        end,
        desc = 'Jumps',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = 'Keymaps',
      },
      {
        '<leader>sl',
        function()
          Snacks.picker.loclist()
        end,
        desc = 'Location List',
      },
      {
        '<leader>sm',
        function()
          Snacks.picker.marks()
        end,
        desc = 'Marks',
      },
      {
        '<leader>sM',
        function()
          Snacks.picker.man()
        end,
        desc = 'Man Pages',
      },
      {
        '<leader>sp',
        function()
          Snacks.picker.lazy()
        end,
        desc = 'Search for Plugin Spec',
      },
      {
        '<leader>sq',
        function()
          Snacks.picker.qflist()
        end,
        desc = 'Quickfix List',
      },
      {
        '<leader>sR',
        function()
          Snacks.picker.resume()
        end,
        desc = 'Resume',
      },
      {
        '<leader>su',
        function()
          Snacks.picker.undo()
        end,
        desc = 'Undo History',
      },
      {
        '<leader>uC',
        function()
          Snacks.picker.colorschemes()
        end,
        desc = 'Colorschemes',
      },
      -- LSP
      {
        'gd',
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = 'Goto Definition',
      },
      {
        'gD',
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = 'Goto Declaration',
      },
      {
        'gr',
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = 'References',
      },
      {
        'gI',
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = 'Goto Implementation',
      },
      {
        'gy',
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = 'Goto T[y]pe Definition',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = 'LSP Symbols',
      },
      {
        '<leader>sS',
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = 'LSP Workspace Symbols',
      },
      -- Other
      {
        '<leader>z',
        function()
          Snacks.zen()
        end,
        desc = 'Toggle Zen Mode',
      },
      {
        '<leader>Z',
        function()
          Snacks.zen.zoom()
        end,
        desc = 'Toggle Zoom',
      },
      {
        '<leader>.',
        function()
          Snacks.scratch()
        end,
        desc = 'Toggle Scratch Buffer',
      },
      {
        '<leader>S',
        function()
          Snacks.scratch.select()
        end,
        desc = 'Select Scratch Buffer',
      },
      {
        '<leader>n',
        function()
          Snacks.notifier.show_history()
        end,
        desc = 'Notification History',
      },
      {
        '<leader>bd',
        function()
          Snacks.bufdelete()
        end,
        desc = 'Delete Buffer',
      },
      {
        '<leader>cR',
        function()
          Snacks.rename.rename_file()
        end,
        desc = 'Rename File',
      },
      {
        '<leader>gB',
        function()
          Snacks.gitbrowse()
        end,
        desc = 'Git Browse',
        mode = { 'n', 'v' },
      },
      {
        '<leader>gg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },
      {
        '<leader>un',
        function()
          Snacks.notifier.hide()
        end,
        desc = 'Dismiss All Notifications',
      },
      {
        '<c-/>',
        function()
          Snacks.terminal()
        end,
        desc = 'Toggle Terminal',
      },
      {
        '<c-_>',
        function()
          Snacks.terminal()
        end,
        desc = 'which_key_ignore',
      },
      {
        ']]',
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = 'Next Reference',
        mode = { 'n', 't' },
      },
      {
        '[[',
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = 'Prev Reference',
        mode = { 'n', 't' },
      },
      {
        '<leader>N',
        desc = 'Neovim News',
        function()
          Snacks.win {
            file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = 'yes',
              statuscolumn = ' ',
              conceallevel = 3,
            },
          }
        end,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
          Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
          Snacks.toggle.diagnostics():map '<leader>ud'
          Snacks.toggle.line_number():map '<leader>ul'
          Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
          Snacks.toggle.treesitter():map '<leader>uT'
          Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
          Snacks.toggle.inlay_hints():map '<leader>uh'
          Snacks.toggle.indent():map '<leader>ug'
          Snacks.toggle.dim():map '<leader>uD'
        end,
      })
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    config = function()
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'vscode'
    end,
  },
  -- {
  --   'amitds1997/remote-nvim.nvim',
  --   version = '*', -- Pin to GitHub releases
  --   dependencies = {
  --     'nvim-lua/plenary.nvim', -- For standard functions
  --     'MunifTanjim/nui.nvim', -- To build the plugin UI
  --     'nvim-telescope/telescope.nvim', -- For picking b/w different remote methods
  --   },
  --   config = true,
  -- },
  -- {
  --   'inhesrom/remote-ssh.nvim',
  --   branch = 'master',
  --   dependencies = {
  --     'inhesrom/telescope-remote-buffer', --See https://github.com/inhesrom/telescope-remote-buffer for features
  --     'nvim-telescope/telescope.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'neovim/nvim-lspconfig',
  --     -- nvim-notify is recommended, but not necessarily required into order to get notifcations during operations - https://github.com/rcarriga/nvim-notify
  --     'rcarriga/nvim-notify',
  --   },
  --   config = function()
  --     require('telescope-remote-buffer').setup(
  --       -- Default keymaps to open telescope and search open buffers including "remote" open buffers
  --       --fzf = "<leader>fz",
  --       --match = "<leader>gb",
  --       --oldfiles = "<leader>rb"
  --     )
  --
  --     -- setup lsp_config here or import from part of neovim config that sets up LSP
  --
  --     require('remote-ssh').setup {
  --       on_attach = lsp_config.on_attach,
  --       capabilities = lsp_config.capabilities,
  --       filetype_to_server = lsp_config.filetype_to_server,
  --     }
  --   end,
  -- },
  -- NOTE: auto-import
  -- {
  --   'alexpasmantier/pymple.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     -- optional (nicer ui)
  --     'stevearc/dressing.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   build = ':PympleBuild',
  --   config = function()
  --     require('pymple').setup()
  --   end,
  --   -- automatically register the following keymaps on plugin setup
  --   keymaps = {
  --     -- Resolves import for symbol under cursor.
  --     -- This will automatically find and add the corresponding import to
  --     -- the top of the file (below any existing doctsring)
  --     resolve_import_under_cursor = {
  --       desc = 'Resolve import under cursor',
  --       keys = '<leader>li', -- feel free to change this to whatever you like
  --     },
  --   },
  -- },
  -- {
  --   'LintaoAmons/bookmarks.nvim',
  --   -- pin the plugin at specific version for stability
  --   -- backup your bookmark sqlite db when there are breaking changes (major version change)
  --   tag = '3.2.0',
  --   dependencies = {
  --     { 'kkharji/sqlite.lua' },
  --     { 'nvim-telescope/telescope.nvim' }, -- currently has only telescopes supported, but PRs for other pickers are welcome
  --     { 'stevearc/dressing.nvim' }, -- optional: better UI
  --     { 'GeorgesAlkhouri/nvim-aider' }, -- optional: for Aider integration
  --   },
  --   config = function()
  --     local opts = {} -- check the "./lua/bookmarks/default-config.lua" file for all the options
  --     require('bookmarks').setup(opts) -- you must call setup to init sqlite db
  --   end,
  -- },
  {
    'linux-cultist/venv-selector.nvim',
    enabled = false,
    dependencies = {
      'neovim/nvim-lspconfig',
      -- { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python', -- Important for DAP integration
      { 'folke/snacks.nvim' },
    },
    ft = 'python', -- Load when opening Python files
    keys = {
      { 'vs', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
      search = {
        mac_conda = {
          command = "fd --full-path '/bin/python$' /opt/anaconda3/envs --color never -E /proc",
        },
      }, -- if you add your own searches, they go here.
      options = {}, -- if you add plugin options, they go here.
    },
  },
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    dependencies = {
      'rcarriga/nvim-dap-ui', -- sidebars, REPL, scopes
      {
        'jay-babu/mason-nvim-dap.nvim',
        config = function(_, opts)
          require('mason-nvim-dap').setup(opts)
        end,
        opts = {
          -- This is the crucial part that links mason and dap
          handlers = {},
          ensure_installed = { 'python' },
        },
      }, -- installs debugpy automatically

      -- 'theHamsta/nvim-dap-virtual-text',
      -- UI for DAP
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          local dapui = require 'dapui'
          dapui.setup()
          -- Auto-open/close UI on debug events
          local dap = require 'dap'
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end
        end,
      },
    },
    keys = {},
    config = function()
      local dap = require 'dap'
      require('dap.ext.vscode').load_launchjs()

      -- Vscode-like launch json
      -- require('dap.ext.vscode').load_launchjs(
      --   -- path relative to project root:
      --   '.nvim/launch.json',
      --   { python = { 'python', 'dap-python' } } -- adapter name mapping
      -- )

      -- Basic key-maps
      vim.keymap.set('n', '<F9>', function()
        require('dap').configurations.python = {} -- clear previous configs
        dap.continue()
      end, { desc = 'DAP Continue' })
      vim.keymap.set('n', '<F8>', dap.step_over, { desc = 'DAP Step Over' })
      vim.keymap.set('n', '<F7>', dap.step_into, { desc = 'DAP Step Into' })
      vim.keymap.set('n', '<S-F8>', dap.step_out, { desc = 'DAP Step Out' })
      vim.keymap.set('n', '<F6>', dap.terminate, { desc = 'DAP: Terminate Session' })
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'DAP Toggle BP' })
    end,
  },

  -- Python adapter ----------------------------------------------------
  {
    'mfussenegger/nvim-dap-python',
    dependencies = { 'mfussenegger/nvim-dap' },
    ft = 'python',
    config = function()
      --  ❱❱ 1-line setup: Mason installs debugpy in ~/.local/share/nvim/mason
      require('dap-python').resolve_python = function()
        return os.getenv 'VIRTUAL_ENV' .. '/bin/python'
      end
      -- require('dap-python').setup(require('mason-registry').get_package('debugpy'):get_install_path() .. '/venv/bin/python')

      -- default runner detection: pytest > django > unittest
      -- force unittest explicitly:
      require('dap-python').test_runner = 'unittest'

      -- handy test shortcuts
      vim.keymap.set('n', '<leader>dt', function()
        require('dap-python').test_method()
      end, { desc = 'Debug nearest test' })
      vim.keymap.set('n', '<leader>dT', function()
        require('dap-python').test_class()
      end, { desc = 'Debug test class' })
    end,
  },
  -- Copilot, only enable AI completion
  {
    'zbirenbaum/copilot.lua',
    enabled = true,
    cmd = 'Copilot',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = true },
        panel = { enabled = false },
        filetypes = {
          yaml = true,
          markdown = true,
          help = true,
          gitcommit = true,
          gitrebase = false,
          hgcommit = true,
          svn = false,
          cvs = false,
          ['.'] = false,
        },
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = 'zbirenbaum/copilot.lua',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      allow_insecure = true,
      proxy = 'socks5://127.0.0.1:8083',
      adapters = {
        http = {
          ollama = function()
            return require('codecompanion.adapters').extend('ollama', {
              env = {
                url = 'http://10.66.65.129:11434',
                api_key = 'dummy',
              },
              headers = {
                ['Content-Type'] = 'application/json',
                ['Authorization'] = 'Bearer ${api_key}',
              },
              parameters = {
                sync = true,
              },
            })
          end,
          trtllm = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              name = 'trtllm',
              env = {
                url = 'http://10.66.65.129:8000/v1',
                api_key = 'dummy',
                chat_url = '/chat/completions',
              },
              schema = {
                model = { default = 'Qwen/Qwen2.5-Coder-7B-Instruct' },
                num_ctx = { default = 8192 },
                think = { default = false },
              },
            })
          end,
          openrouter = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              name = 'openrouter',
              env = {
                url = 'https://openrouter.ai/api',
                api_key = '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',
                chat_url = '/v1/chat/completions',
              },
              schema = {
                model = {
                  default = 'x-ai/grok-code-fast-1',
                },
                temperature = {
                  default = 0.3,
                },
              },
            })
          end,
          gemini = function()
            return require('codecompanion.adapters').extend('gemini', {
              name = 'gemini',
              env = {
                api_key = 'AIzaSyBrT_88zuGas-k8sixDPbbql6cr5X8uE7c',
              },
              schema = {
                model = {
                  default = 'gemini-2.5-pro',
                },
              },
            })
          end,
          local_gemini = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              name = 'local_gemini',
              env = {
                url = 'http://localhost:8787',
                api_key = 'sk-local',
              },
              opts = {
                stream = false,
              },
              schema = {
                model = {
                  default = 'gemini-2.5-pro',
                },
                temperature = {
                  default = 0.3,
                },
              },
            })
          end,
          gemini = function()
            return require('codecompanion.adapters').extend('gemini', {
              -- Prefer environment variables; can also use "cmd:..." to shell out
              env = {
                -- Example: export GEMINI_API_KEY=...
                api_key = 'AIzaSyBrT_88zuGas-k8sixDPbbql6cr5X8uE7c',
              },
              -- Optional: set a default model via the schema hook
              schema = {
                model = {
                  -- Pick a valid Gemini model (examples below)
                  default = 'gemini-2.5-pro',
                },
              },
            })
          end,
        },
      },
      -- config = function(_, opts)
      --   vim.env.OPENROUTER_API_KEY = 'dummy'
      --   vim.env.CODECOMPANION_OPENAI_API_KEY = 'dummy'
      --   vim.env.CODECOMPANION_OPENAI_BASE_URL = 'http://10.66.65.129:8000/v1'
      --   vim.env.CODECOMPANION_OLLAMA_API_KEY = 'dummy'
      --   vim.env.CODECOMPANION_OLLAMA_BASE_URL = 'http://10.66.65.129:11434'
      --   require('codecompanion').setup(opts)
      -- end,
      strategies = {
        chat = { adapter = 'gemini' },
        agent = { adapter = 'gemini' },
        inline = {
          adapter = 'gemini',
          keymaps = {
            accept_change = {
              modes = { n = 'ga' },
              description = 'Accept the suggested change',
            },
            reject_change = {
              modes = { n = 'gr' },
              opts = { nowait = true },
              description = 'Reject the suggested change',
            },
          },
        },
      },
      display = {
        action_palette = {
          provider = 'snacks', -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
          opts = {
            show_default_actions = true, -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
            title = 'CodeCompanion actions', -- The title of the action palette
          },
        },
      },
    },
  },
  {
    'milanglacier/minuet-ai.nvim',
    enabled = false, -- WARN: This plugin is literally a shit!!!
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      -- optional, if you are using virtual-text frontend, nvim-cmp is not
      -- required.
      { 'hrsh7th/nvim-cmp' },
      -- -- optional, if you are using virtual-text frontend, blink is not required.
      -- { 'Saghen/blink.cmp' },
    },
    opts = {
      presets = {
        vllm = {
          provider = 'openai_fim_compatible',
          request_timeout = 20,
          throttle = 400,
          debounce = 100,
          context_window = 1024,

          provider_options = {
            openai_compatible = {
              model = 'microsoft/Phi-3-mini-128k-instruct',
              -- system = 'see [Prompt] section for the default value',
              -- few_shots = 'see [Prompt] section for the default value',
              -- chat_input = 'See [Prompt Section for default value]',
              stream = false,
              end_point = 'https://10.66.65.129:8001/v1/chat/completions',
              -- api_key = function()
              --   return 'TERM'
              -- end,
              api_key = 'VLLM_API_KEY',
              name = 'vllm',
              optional = {
                stop = nil,
                max_tokens = 1024,
                top_p = 0.3,
              },
            },
          },
        },
        gemini = {
          provider = 'gemini',
          request_timeout = 20,
          throttle = 2000,
          debounce = 500,
          context_window = 32000,
          provider_options = {
            gemini = {
              model = 'gemini-2.5-flash',
              -- system = 'see [Prompt] section for the default value',
              -- few_shots = 'see [Prompt] section for the default value',
              -- chat_input = 'See [Prompt Section for default value]',
              stream = false,
              end_point = 'https://generativelanguage.googleapis.com/v1beta/models',
              api_key = function()
                return 'AIzaSyBrT_88zuGas-k8sixDPbbql6cr5X8uE7c'
              end,
              optional = {
                top_p = 0.3,
                generationConfig = {
                  maxOutputTokens = 256,
                  -- When using `gemini-2.5-flash`, it is recommended to entirely
                  -- disable thinking for faster completion retrieval.
                  thinkingConfig = {
                    thinkingBudget = 0,
                  },
                },
                safetySettings = {
                  {
                    -- HARM_CATEGORY_HATE_SPEECH,
                    -- HARM_CATEGORY_HARASSMENT
                    -- HARM_CATEGORY_SEXUALLY_EXPLICIT
                    category = 'HARM_CATEGORY_DANGEROUS_CONTENT',
                    -- BLOCK_NONE
                    threshold = 'BLOCK_ONLY_HIGH',
                  },
                },
              },
            },
          },
        },
      },
    },
  },
  {
    'amitds1997/remote-nvim.nvim',
    enabled = false,
    version = '*', -- Pin to GitHub releases
    dependencies = {
      'nvim-lua/plenary.nvim', -- For standard functions
      'MunifTanjim/nui.nvim', -- To build the plugin UI
      'nvim-telescope/telescope.nvim', -- For picking b/w different remote methods
    },
    config = true,
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'Spectre' }, -- lazy-load on :Spectre
    keys = {
      {
        '<leader>S',
        function()
          require('spectre').toggle()
        end,
        desc = 'Toggle Spectre',
      },
      {
        '<leader>sw',
        function()
          require('spectre').open_visual { select_word = true }
        end,
        desc = 'Search word',
      },
      {
        '<leader>sp',
        function()
          require('spectre').open_file_search { select_word = true }
        end,
        desc = 'Search in file',
      },
      {
        '<leader>sl',
        function()
          require('spectre').resume_last_search()
        end,
        desc = 'Resume Spectre',
      },
    },
    opts = {
      open_cmd = 'vnew',
      lnum_for_results = true,
      use_trouble_qf = false,
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
    },
  },
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Recommended for better prompt input, and required to use `opencode.nvim`'s embedded terminal — otherwise optional
      { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
    },
    config = function()
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`
        prompts = {
          write_doc = {
            description = 'Write doc for the code near cursor',
            prompt = 'Write doc for @cursor based on its context',
          },
          fix_diagnostic = {
            description = 'Fix diagnostics',
            prompt = 'Fix @diagnostics',
          },
          generate_commit_message = {
            description = 'Generate commit message',
            prompt = '@diff: Generate a concise Conventional Commit message for the staged changes. Output only the commit message (subject line and optional body), no extra text.',
          },
        },
      }

      -- Required for `opts.auto_reload`
      vim.opt.autoread = true

      -- Recommended keymaps
      vim.keymap.set('n', '<leader>ot', function()
        require('opencode').toggle()
      end, { desc = 'Toggle' })
      vim.keymap.set('n', '<leader>oA', function()
        require('opencode').ask()
      end, { desc = 'Ask' })
      vim.keymap.set('n', '<leader>oa', function()
        require('opencode').ask '@cursor: '
      end, { desc = 'Ask about this' })
      vim.keymap.set('v', '<leader>oa', function()
        require('opencode').ask '@selection: '
      end, { desc = 'Ask about selection' })
      vim.keymap.set('n', '<leader>o+', function()
        require('opencode').prompt('@buffer', { append = true })
      end, { desc = 'Add buffer to prompt' })
      vim.keymap.set('v', '<leader>o+', function()
        require('opencode').prompt('@selection', { append = true })
      end, { desc = 'Add selection to prompt' })
      vim.keymap.set('n', '<leader>on', function()
        require('opencode').command 'session_new'
      end, { desc = 'New session' })
      vim.keymap.set('n', '<leader>oy', function()
        require('opencode').command 'messages_copy'
      end, { desc = 'Copy last response' })
      vim.keymap.set('n', '<S-C-u>', function()
        require('opencode').command 'messages_half_page_up'
      end, { desc = 'Messages half page up' })
      vim.keymap.set('n', '<S-C-d>', function()
        require('opencode').command 'messages_half_page_down'
      end, { desc = 'Messages half page down' })
      vim.keymap.set({ 'n', 'v' }, '<leader>os', function()
        require('opencode').select()
      end, { desc = 'Select prompt' })

      -- Example: keymap for custom prompt
      vim.keymap.set('n', '<leader>oe', function()
        require('opencode').prompt 'Explain @cursor and its context'
      end, { desc = 'Explain this code' })
    end,
  },
  {
    'nosduco/remote-sshfs.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      local api = require 'remote-sshfs.api'
      vim.keymap.set('n', '<leader>rc', api.connect, {})
      vim.keymap.set('n', '<leader>rd', api.disconnect, {})
      vim.keymap.set('n', '<leader>re', api.edit, {})
      -- Override telescope find_files and live_grep to make dynamic based on if connected to host
      local builtin = require 'telescope.builtin'
      local connections = require 'remote-sshfs.connections'
      vim.keymap.set('n', '<leader>ff', function()
        if connections.is_connected() then
          api.find_files()
        else
          builtin.find_files()
        end
      end, {})
      vim.keymap.set('n', '<leader>sg', function()
        if connections.is_connected() then
          api.live_grep()
        else
          builtin.live_grep()
        end
      end, {})
    end,
  },
  {
    'fatih/vim-go',
    enabled = false,
    ft = { 'go', 'gomod', 'gowork', 'gotmpl' },
    -- Run this once on install/update to fetch gopls, goimports, etc.
    build = ':GoUpdateBinaries', -- or ":GoInstallBinaries"
    init = function()
      -- Recommended basics
      vim.g.go_def_mode = 'gopls'
      vim.g.go_info_mode = 'gopls'
      vim.g.go_fmt_command = 'goimports'
      vim.g.go_fmt_autosave = 1
    end,
    config = function()
      -- Go buffer–local mappings that mirror common DAP keys
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'go',
        callback = function()
          local map = function(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, { buffer = true, silent = true, desc = desc })
          end
          -- Leader-based (align with LazyVim DAP defaults like <leader>dc, <leader>db, etc.)
          map('<leader>b', ':GoDebugBreakpoint<CR>', 'Toggle Breakpoint')
          map('<leader>dx', ':GoDebugStop<CR>', 'Terminate')

          -- Optional F-keys (commonly used by DAP UIs)
          map('<F5>', ':GoDebugContinue<CR>', 'Go Continue')
          map('<F8>', ':GoDebugNext<CR>', 'Step Over')
          map('<F7>', ':GoDebugStep<CR>', 'Step Into')
          map('<S-F8>', ':GoDebugStepOut<CR>', 'Step Out')
        end,
      })

      -- Define once (e.g., in vim-go plugin config), only for Go buffers
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'go',
        callback = function()
          local function shim(cmd, go)
            if vim.fn.exists(':' .. cmd) == 0 then
              vim.api.nvim_create_user_command(cmd, function()
                vim.cmd(go)
              end, {})
            end
          end
          shim('DapContinue', 'GoDebugContinue')
          shim('DapStepOver', 'GoDebugNext')
          shim('DapStepInto', 'GoDebugStep')
          shim('DapStepOut', 'GoDebugStepOut')
          shim('DapToggleBreakpoint', 'GoDebugBreakpoint')
          shim('DapTerminate', 'GoDebugStop')
        end,
      })
    end,
  },
  -- Go plugin with everything enabled
  {
    'ray-x/go.nvim',
    ft = { 'go', 'gomod', 'gosum', 'gohtmltmpl', 'gotmpl', 'gotexttmpl' },
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      -- 'nvim-dap-virtual-text',
    },
    keys = {
      --   { '<F9>', '<cmd>GoDebug<cr>', desc = 'Go Debug (launch)' },
      --   { '<leader>dn', '<cmd>GoDebug -n<cr>', desc = 'Go Debug Nearest Test' },
      --   { '<leader>dt', '<cmd>GoDebug -t<cr>', desc = 'Go Debug Test File' },
      --   { '<leader>ds', '<cmd>GoDbgStop<cr>', desc = 'Go Debug Stop' },
      --   { '<leader>dbk', '<cmd>GoBreakToggle<cr>', desc = 'Go Toggle Breakpoint' },
      { '<leader>tf', '<cmd>GoTestFunc<cr>', desc = 'Go Test func' },
      { '<leader>td', '<cmd>GoDebug -n<cr>', desc = 'Go debug test' },
    },
    opts = {
      -- Core tooling
      go = 'go',
      goimports = 'gopls', -- LSP goimports + formatting
      gofmt = 'gopls', -- use gopls for formatting
      fillstruct = 'gopls', -- use gopls actions

      -- LSP (use go.nvim’s tuned defaults)
      lsp_cfg = true,
      lsp_gofumpt = true,
      lsp_keymaps = false, -- conflict with <leader>e
      lsp_codelens = true,
      lsp_inlay_hints = { enable = true },

      -- Debugger (Delve via nvim-dap)
      dap_debug = true,
      dap_debug_keymap = true, -- GDB-style keys: c/n/s/o/S/u/D/C/b/P/p
      dap_debug_gui = {}, -- use dap-ui if present
      dap_debug_vt = { enabled = true, enabled_commands = true, all_frames = true },

      -- Testing, coverage, floaterm
      test_runner = 'go', -- can be "go", "dlv", "ginkgo", or "gotestsum"
      verbose_tests = true,
      run_in_floaterm = true, -- nice for ginkgo/gotestsum output
      floaterm = { posititon = 'auto', width = 0.45, height = 0.98 },

      -- Signs, diagnostics and textobjects
      gocoverage_sign = '█',
      sign_priority = 5,
      textobjects = true,

      -- Tags, snippets, linters
      tag_options = 'json=omitempty',
      luasnip = true,

      -- Optional null-ls hooks inside go.nvim (pair with null-ls spec below)
      -- null_ls = {
      --   golangci_lint = {
      --     method = { 'NULL_LS_DIAGNOSTICS_ON_SAVE', 'NULL_LS_DIAGNOSTICS_ON_OPEN' },
      --   },
      --   gotest = {
      --     method = { 'NULL_LS_DIAGNOSTICS_ON_SAVE' },
      --   },
      -- },

      -- Example default build tags used by some commands
      -- build_tags = 'tag1,tag2',
    },
    config = function(_, opts)
      require('go').setup(opts)
      -- Format on save (goimports + gofumpt via gopls)
      -- Comment out since it tries to install gopls everytime i save file
      -- local grp = vim.api.nvim_create_augroup('GoFormat', {})
      -- vim.api.nvim_create_autocmd('BufWritePre', {
      --   group = grp,
      --   pattern = '*.go',
      --   callback = function()
      --     require('go.format').goimports()
      --   end,
      -- })
    end,
    -- Install/update all required Go tools (dlv, golines, gotests, gomodifytags, etc.)
    build = ':lua require("go.install").update_all_sync()',
  },
  -- nvim-dap virtual text
  {
    'theHamsta/nvim-dap-virtual-text',
    enabled = false,
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter', -- recommended for variable locations
    },
    opts = {}, -- you can also use config = function() require("nvim-dap-virtual-text").setup({}) end
    config = function(_, opts)
      require('nvim-dap-virtual-text').setup(opts)
    end,
  },
}
