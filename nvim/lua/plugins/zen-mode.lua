return {
  "folke/zen-mode.nvim",
  dependencies = {
    "folke/twilight.nvim",
  },
  cmd = "ZenMode",
  keys = {
    { "<Leader>z", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
  },
  config = function()
    require("zen-mode").setup({
      window = {
        backdrop = 1,
        width = 100,
        height = 0.9,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        }
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        kitty = {
          enabled = false,
          font = "+4",
        },
        alacritty = {
          enabled = false,
          font = "14",
        },
        wezterm = {
          enabled = false,
          font = "+4",
        },
      },
      on_open = function(win)
      end,
      on_close = function()
      end
    })

    require("twilight").setup({
      dimming = {
        alpha = 0.4,
        color = { "Normal", "#5E81AC" },
        term_bg = "#2E3440",
        inactive = false,
      },
      context = 10,
      treesitter = true,
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {},
    })
  end
}
