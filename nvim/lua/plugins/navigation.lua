-- Navigation plugins

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_config = {
            horizontal = {
              preview_width = 0.6,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_ignore_patterns = {
            "node_modules/.*",
            "%.git/.*",
            "target/.*",
            "%.gems/.*",
            "tmp/.*",
            "log/.*",
            "logs/.*",
            "__pycache__/.*",
            "%.pyc$",
            "Icon.*"
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
          },
        },
        pickers = {
          find_files = {
            -- Use git files when in git repo
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
          },
          live_grep = {
            additional_args = function()
              return {"--hidden"}
            end
          },
        },
      })

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<Leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<Leader>fh', builtin.help_tags, { desc = 'Find help' })
      vim.keymap.set('n', '<Leader>fr', builtin.oldfiles, { desc = 'Find recent files' })
      vim.keymap.set('n', '<Leader>fc', builtin.git_commits, { desc = 'Find git commits' })
      vim.keymap.set('n', '<Leader>fs', builtin.git_status, { desc = 'Find git status' })
      vim.keymap.set('n', '<Leader>fw', builtin.grep_string, { desc = 'Find word under cursor' })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Overrides
        vim.keymap.set("n", "C", api.tree.change_root_to_node, opts "CD")
        vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts "Up")
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
        vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
      end

      require('nvim-tree').setup({
        on_attach = on_attach,
        view = {
          width = 30,
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = false
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = {
            '^\\.gems$',
            '^tags$',
            '^target$',
            '^node_modules$',
            '^tmp$',
            '^log$',
            '^logs$',
            '^__pycache__$',
            '\\.pyc$',
            'Icon.*',
            'ruby-lsp'
          },
        },
        git = {
          enable = false,
          ignore = false,
        },
        actions = {
          change_dir = {
            enable = true,
            global = true,
          },
          open_file = {
            quit_on_open = false,
            resize_window = true,
          },
        },
      })
    end,
  },
}
