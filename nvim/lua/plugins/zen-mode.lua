return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<Leader>z", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
  },
  config = function()
    require("zen-mode").setup({
      window = {
        backdrop = 1,
        width = 102,
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
        local group = vim.api.nvim_create_augroup("ZenModeSignColumn", { clear = true })
        vim.api.nvim_create_autocmd("BufEnter", {
          group = group,
          callback = function()
            vim.wo[win].signcolumn = "no"
          end
        })
      end,
      on_close = function()
        vim.api.nvim_del_augroup_by_name("ZenModeSignColumn")
      end
    })
  end
}
