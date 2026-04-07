vim.g.mapleader = ','
vim.g.maplocalleader = ';'

-- On macOS, child processes spawned by Neovim use a non-login shell, so .zshrc
-- is never sourced and Homebrew binaries (e.g. tree-sitter) are not on PATH.
if vim.uv.os_uname().sysname == 'Darwin' then
  vim.env.PATH = vim.env.PATH .. ':/opt/homebrew/bin'
end

require('config.lazy')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

require('config.options')
require('config.keymaps')
require('config.lsp')
