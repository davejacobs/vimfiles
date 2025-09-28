vim.g.mapleader = ','
vim.g.maplocalleader = ';'

require("plugins")

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

require('config.options')   -- Basic options
require('config.keymaps')   -- Key mappings
require('config.functions') -- Utility functions
require('config.utils')     -- Utility functions
require('config.lsp')       -- Configured separately due to complexity
