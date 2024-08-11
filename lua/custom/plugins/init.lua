--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },
  {
    'zbirenbaum/copilot.lua',
    dependencies = {
      'copilotlsp-nvim/copilot-lsp', -- (optional) for NES functionality
    },
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
          layout = {
            position = 'bottom', -- or "top"
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = '<Tab>',
            accept_word = '<M-w>',
            accept_line = '<M-l>',
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
          },
        },
        filetypes = {
          ['*'] = true,                -- enable for all filetypes
        },
        copilot_node_command = 'node', -- Node.js executable
        server_opts_overrides = {},
      }
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = 'DEBUG', -- or "TRACE"
      },
    },
  },
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require 'fluoromachine'

      fm.setup {
        glow = true,
        theme = 'delta', --fluoromachine retrowave delta
        transparent = false,
      }

      vim.cmd.colorscheme 'fluoromachine'
    end,
  },
  {
    'ThePrimeagen/harpoon',
    lazy = false,
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<C-a>', function() harpoon:list():add() end)
      vim.keymap.set('n', '<C-d>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end)
      vim.keymap.set('n', '<C-j>', function() harpoon:list():select(2) end)
      vim.keymap.set('n', '<C-k>', function() harpoon:list():select(3) end)
      vim.keymap.set('n', '<C-l>', function() harpoon:list():select(4) end)
      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-p>', function() harpoon:list():prev() end)
      vim.keymap.set('n', '<C-n>', function() harpoon:list():next() end)
    end,
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    config = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'sioyek'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        options = {
          '-quiet',
          '-verbose',
          '-shell-escape',
          '-interaction=nonstopmode',
          '-file-line-error',
          '-synctex=1',
        },
      }
      vim.g.vimtex_compiler_tectonic = {
        options = {
          '-X',
          'watch',
          '--keep-intermediates',
          '--keep-logs',
        },
      }
      -- vim.g.vimtex_compiler_generic = { command = 'ls *.tex | entr -c tectonic /_ --synctex --keep-logs' }
      -- vim.g.vimtex_compiler_tectonic = {options=--keep-intermediate}
      vim.g.vimtex_fold_enabled = 0
      vim.g.vimtex_indent_enabled = 0
      -- vim.wo.conceallevel = 2
      -- vim.g.vimtex_syntax_conceal = {
      --   cites = 0,
      --   sections = 1,
      -- }
    end,
  },
  -- {
  --   'folke/trouble.nvim',
  --   config = function()
  --     require('trouble').setup {
  --       icons = false,
  --     }
  --
  --     vim.keymap.set('n', '<leader>tt', function() require('trouble').toggle() end)
  --
  --     vim.keymap.set('n', '[t', function() require('trouble').next { skip_groups = true, jump = true } end)
  --
  --     vim.keymap.set('n', ']t', function() require('trouble').previous { skip_groups = true, jump = true } end)
  --   end,
  -- },
}
