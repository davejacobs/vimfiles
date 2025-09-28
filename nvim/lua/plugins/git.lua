-- Git plugins

return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull", "Gbrowse" },
    keys = {
      { "<D-B>", ":Gbrowse<CR>", desc = "Browse on GitHub", mode = { "n", "v" } },
    },
  },
  {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
  },
}