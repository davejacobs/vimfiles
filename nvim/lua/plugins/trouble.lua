return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    { "<Leader>fd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
    { "<Leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (current buffer)" },
    { "<Leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list (Trouble)" },
    { "<Leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list (Trouble)" },
    { "]x", function() require("trouble").next({ skip_groups = true, jump = true }) end, desc = "Next Trouble item" },
    { "[x", function() require("trouble").prev({ skip_groups = true, jump = true }) end, desc = "Previous Trouble item" },
  },
  opts = {
    -- Keep the source in sync as you move through the list, but leave the Trouble
    -- window open so it behaves like VSCode's Problems panel.
    focus = true,
    auto_close = false,
    auto_preview = true,
    modes = {
      diagnostics = {
        -- <cr> jumps to the item without closing the panel.
        win = { position = "bottom" }
      }
    },
    keys = {
      ["<cr>"] = "jump",
      ["<esc>"] = "close"
    }
  }
}
