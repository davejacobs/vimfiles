" vimrc - Universal customization for Vim
" by David Jacobs

set nocompatible
filetype off
runtime! plugins.vim
filetype plugin indent on
syntax on

runtime! config/basic.vim
runtime! config/coc.vim
runtime! config/functions.vim
runtime! config/keybindings.vim
runtime! config/plugins-config.vim
