return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull", "Gbrowse" },
  keys = {
    { "<C-G>", ":Git<CR>", desc = "Open Git viewer", mode = { "n", "v" } }
  },
}
