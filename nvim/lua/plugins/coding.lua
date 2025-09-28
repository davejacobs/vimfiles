-- Code editing and tools

return {
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        -- Priority list of preferred backends for aerial.
        backends = { "treesitter", "lsp", "markdown", "man" },

        layout = {
          -- These control the width of the aerial window.
          max_width = { 40, 0.2 },
          width = nil,
          min_width = 10,

          -- key-value pairs of window-local options for aerial window (e.g. winhl)
          win_opts = {},

          -- Determines the default direction to open the aerial window. The 'prefer'
          -- options will open the window in the other direction *if* there is a
          -- different buffer in the way of the preferred direction
          default_direction = "prefer_right",

          -- Determines where the aerial window will be opened
          placement = "window",
        },

        -- Determines how the aerial window decides which buffer to display symbols for
        attach_mode = "window",

        -- List of enum values that configure when to auto-close the aerial window
        close_automatic_events = {},

        -- Keymaps in aerial window. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
        keymaps = {
          ["?"] = "actions.show_help",
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.jump",
          ["<2-LeftMouse>"] = "actions.jump",
          ["<C-v>"] = "actions.jump_vsplit",
          ["<C-s>"] = "actions.jump_split",
          ["p"] = "actions.scroll",
          ["<C-j>"] = "actions.down_and_scroll",
          ["<C-k>"] = "actions.up_and_scroll",
          ["{"] = "actions.prev",
          ["}"] = "actions.next",
          ["[["] = "actions.prev_up",
          ["]]"] = "actions.next_up",
          ["q"] = "actions.close",
          ["o"] = "actions.tree_toggle",
          ["za"] = "actions.tree_toggle",
          ["O"] = "actions.tree_toggle_recursive",
          ["zA"] = "actions.tree_toggle_recursive",
          ["l"] = "actions.tree_open",
          ["zo"] = "actions.tree_open",
          ["L"] = "actions.tree_open_recursive",
          ["zO"] = "actions.tree_open_recursive",
          ["h"] = "actions.tree_close",
          ["zc"] = "actions.tree_close",
          ["H"] = "actions.tree_close_recursive",
          ["zC"] = "actions.tree_close_recursive",
          ["zr"] = "actions.tree_increase_fold_level",
          ["zR"] = "actions.tree_open_all",
          ["zm"] = "actions.tree_decrease_fold_level",
          ["zM"] = "actions.tree_close_all",
          ["zx"] = "actions.tree_sync_folds",
          ["zX"] = "actions.tree_sync_folds",
        },

        -- When true, don't load aerial until a command or function is called
        lazy_load = true,

        -- Disable aerial on files with this many lines
        disable_max_lines = 10000,

        -- Disable aerial on files this size or larger (in bytes)
        disable_max_size = 2000000, -- Default 2MB

        -- A list of all symbols to display. Set to false to display all symbols.
        filter_kind = {
          "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Module",
          "Method",
          "Struct",
        },
      })

      -- Keybinding for aerial
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle aerial" })

      -- Telescope integration (if you want to search symbols)
      vim.keymap.set("n", "<leader>ds", "<cmd>Telescope aerial<CR>", { desc = "Search symbols" })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          markdown = { "prettier" },
          sh = { "shfmt" },
          bash = { "shfmt" },
          zsh = { "shfmt" },
          haskell = { "fourmolu" },
          ruby = { "rubocop" },
          python = { "ruff_format", "ruff_fix" },
          html = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          sass = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" }
        },

        -- Configure formatters
        formatters = {
          prettier = {
            -- Look for prettier config in project
            args = function()
              local args = { "--stdin-filepath", "$FILENAME" }
              local config_files = {".prettierrc", ".prettierrc.json", ".prettierrc.js", "prettier.config.js"}
              for _, config in ipairs(config_files) do
                if vim.fn.filereadable(config) == 1 then
                  table.insert(args, "--config")
                  table.insert(args, vim.fn.fnamemodify(config, ":p"))
                  break
                end
              end
              return args
            end,
          },
          rubocop = {
            args = { "--auto-correct", "--format", "files", "--stdin", "$FILENAME" },
          },
          shfmt = {
            args = { "-i", "2" }, -- 2-space indentation (matches your vim settings)
          },
        }
      })

      -- Commands for manual formatting
      vim.api.nvim_create_user_command('Format', function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, range = range })
      end, { range = true })

      vim.keymap.set({ "n", "v" }, "<Leader>i", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format buffer or range (manual)" })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require('Comment').setup({
        -- Add a space b/w comment and the line (matches your NERDSpaceDelims setting)
        padding = true,
        -- Whether the cursor should stay at its position
        sticky = true,
        -- Lines to be ignored while (un)comment
        ignore = nil,
        -- LHS of toggle mappings in NORMAL mode
        toggler = {
          line = 'gcc',       -- Line-comment toggle keymap
          block = 'gbc',      -- Block-comment toggle keymap
        },
        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          line = 'gc',        -- Line-comment keymap
          block = 'gb',       -- Block-comment keymap
        },
        -- LHS of extra mappings
        extra = {
          above = 'gcO',      -- Add comment on the line above
          below = 'gco',      -- Add comment on the line below
          eol = 'gcA',        -- Add comment at the end of line
        },
        -- Disable default mappings so we can use custom ones
        mappings = {
          basic = true,
          extra = true,
        },
      })

      -- Add custom keybindings to match your existing TComment setup
      local api = require('Comment.api')
      vim.keymap.set('n', '<Leader>/', api.toggle.linewise.current, { desc = 'Comment toggle current line' })
      vim.keymap.set('v', '<Leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = 'Comment toggle linewise (visual)' })
    end,
  },
  {
    "tpope/vim-endwise",
    event = "InsertEnter",
  },
  {
    "vim-scripts/matchit.zip",
    event = "VeryLazy",
  },
}
