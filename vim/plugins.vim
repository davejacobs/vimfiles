" Plugs.vim - Declarative package management with Vundle

call plug#begin('~/.vim/plugged')

" Current theme
Plug 'nordtheme/vim'

" Past themes
" Plug 'flazz/vim-colorschemes'
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'imsizon/wombat.vim'
" Plug 'herrbischoff/cobalt2.vim'

" Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'EvanDotPro/nerdtree-chmod', { 'on': 'NERDTreeToggle' }

" Status
Plug 'itchyny/lightline.vim'

" Git
Plug 'tpope/vim-fugitive'

" Language server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" General editing
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-dispatch'
Plug 'henrik/vim-qargs'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'rking/ag.vim', { 'on': 'Ag' }

" Writing
Plug 'junegunn/goyo.vim'
Plug 'dkarter/bullets.vim'

" General code editing
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/matchit.zip'

" Language-specific editing
Plug 'vim-ruby/vim-ruby', { 'branch': 'master' }
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'

" Network
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'

call plug#end()
