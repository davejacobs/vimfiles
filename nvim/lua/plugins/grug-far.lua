return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    { "<Leader>fr", function() require("grug-far").open() end, mode = { "n", "v" }, desc = "Find and replace" },
    { "<Leader>fp", function() require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } }) end, mode = { "n", "v" }, desc = "Find and replace in current file" },
  },
  config = function()
    require("grug-far").setup({})
  end
}
