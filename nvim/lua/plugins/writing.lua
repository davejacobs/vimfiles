-- Writing and documentation plugins

return {
  {
    "godlygeek/tabular",
    cmd = "Tabularize"
  },
  {
    "preservim/vim-markdown",
    dependencies = { "godlygeek/tabular" },
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_auto_insert_bullets = 1
    end
  },
  {
    "lervag/vimtex",
    ft = "tex"
  },
  {
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
          backdrop = 1,    -- keep same background as normal (no shading)
          width = 100,     -- width of the Zen window (matches your goyo_width)
          height = 0.9,    -- height of the Zen window (matches your goyo_height)
          options = {
            signcolumn = "no",      -- disable signcolumn
            number = false,         -- disable number column
            relativenumber = false, -- disable relative numbers
            cursorline = false,     -- disable cursorline
            cursorcolumn = false,   -- disable cursor column
            foldcolumn = "0",       -- disable fold column
            list = false,           -- disable whitespace characters
          }
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false,                -- disables the ruler text in the cmd line area
            showcmd = false               -- disables the command in the last line of the screen
          },
          twilight = { enabled = true },  -- enable twilight (will be used if available)
          gitsigns = { enabled = false }, -- disables git signs
          tmux = { enabled = false },     -- disables the tmux statusline
          kitty = {
            enabled = false,
            font = "+4", -- font size increment
          },
          alacritty = {
            enabled = false,
            font = "14", -- font size
          },
          wezterm = {
            enabled = false,
            font = "+4", -- font size increment
          },
        },
        on_open = function(win)
          -- Custom actions when zen-mode opens
        end,
        on_close = function()
          -- Custom actions when zen-mode closes
        end
      })

      -- Configure Twilight, which dims inactive code
      require("twilight").setup({
        dimming = {
          alpha = 0.4, -- amount of dimming (increased for better contrast with Nord)
          color = { "Normal", "#5E81AC" }, -- use Nord blue for dimming
          term_bg = "#2E3440", -- Nord dark background
          inactive = false, -- when true, other windows will be fully dimmed (instead of just the surrounding)
        },
        context = 10, -- amount of lines we will try to show around the current line
        treesitter = true, -- use treesitter when available for the filetype
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {}, -- exclude these filetypes
      })
    end
  },
  {
    "ledger/vim-ledger",
    ft = "ledger",
  }
}
