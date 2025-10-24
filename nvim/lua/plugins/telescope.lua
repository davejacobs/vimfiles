return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  lazy = true,
  keys = {
    { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<C-n>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<Leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<Leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<Leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<Leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
    { "<Leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
    { "<Leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Find git commits" },
    { "<Leader>fs", "<cmd>Telescope git_status<cr>", desc = "Find git status" },
    { "<Leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find word under cursor" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require('telescope.actions').close,
            ["<C-t>"] = require('telescope.actions.layout').toggle_preview,
          },
          n = {
            ["<C-t>"] = require('telescope.actions.layout').toggle_preview,
          }
        },
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
        }
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        },
        live_grep = {
          additional_args = function()
            return {"--hidden"}
          end
        },
      }
    })
  end,
}
