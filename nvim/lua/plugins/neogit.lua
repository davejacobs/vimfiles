return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<C-G>", "<cmd>Neogit<CR>", desc = "Open Neogit", mode = { "n", "v" } }
  },
  cmd = "Neogit",
  config = function()
    require("neogit").setup({
      kind = "tab",
      commit_editor = {
        kind = "tab",
      },
      popup = {
        kind = "split",
      },
      integrations = {
        telescope = true,
        diffview = true,
      },
      mappings = {
        status = {
          ["q"] = "Close",
          ["<C-c>"] = "Close",
        }
      }
    })
  end
}
