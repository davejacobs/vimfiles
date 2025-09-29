-- Initialize plugins

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.colorscheme" },
  { import = "plugins.navigation" },
  { import = "plugins.statusline" },
  { import = "plugins.git" },
  { import = "plugins.lsp" },
  { import = "plugins.editing" },
  { import = "plugins.writing" },
  { import = "plugins.coding" },
  { import = "plugins.languages" },
  { import = "plugins.network" }
}, {
  install = {
    colorscheme = { "nord" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  ui = {
    border = "rounded",
  }
})
