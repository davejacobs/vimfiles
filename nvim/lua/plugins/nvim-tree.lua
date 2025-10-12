return {
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

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "C", api.tree.change_root_to_node, opts "CD")
      vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts "Up")
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
      vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
    end

    require('nvim-tree').setup({
      -- on_attach = on_attach,
      -- Changes the tree root directory on DirChanged and refreshes the tree
      -- sync_root_with_cwd = true,
      -- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree
      -- respect_buf_cwd = false,
      -- update_focused_file = {
      --   enable = false,
      --   update_root = false
      -- },
      actions = {
        -- vim current-directory behavior
        change_dir = {
          -- Change the working directory when changing directories in the tree
          enable = false,
          -- Use `:cd` instead of `:lcd` when changing directories
          global = false
        },
        open_file = {
          quit_on_open = false,
          resize_window = false
        }
      },
      view = {
        width = 25,
        signcolumn = "no"
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false
          }
        }
      },
      git = {
        enable = false,
        ignore = false
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
          'ruby-lsp',
          '\\.DS_Store$'
        }
      }
    })
  end
}

