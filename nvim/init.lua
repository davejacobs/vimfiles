vim.g.mapleader = ','
vim.g.maplocalleader = ';'

require('config.lazy')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

require('config.options')
require('config.keymaps')
require('config.functions')
require('config.utils')
