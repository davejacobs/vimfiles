return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull", "Gbrowse" },
  keys = {
    { "<C-G>", ":GBrowse<CR>", desc = "Browse on GitHub", mode = { "n", "v" } }
  },
}
