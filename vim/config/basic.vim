" Basic.vim - Basic Vim options, with thorough comments

let mapleader = " "

" Filesystem and buffers functionality
set autowriteall        " Save when focus is lost
set autoread            " Detect file changes from outside of Vim and reload
set hidden              " Allow unsaved changes in hidden buffers

" General interface
set number              " Show line numbers
set visualbell t_vb=    " Get rid of that annoying error beep & flash
set scrolloff=3         " How far away from the edge the cursor initiates scrolling
set noshowmode          " Do not show current mode (e.g., --INSERT MODE--)
set statusline=

" Editing interface
set completeopt-=menu   " Bash-like inline completion (preview); type Ctrl+Y to accept completion
set clipboard=unnamed

" Editing functionality
set expandtab           " Use soft tabs
set tabstop=2           " Width of soft tabs
set autoindent 
set shiftwidth=2        " Width of autoindent
set nosmartindent       " Causes problems, esp. with reindenting hashes
set smarttab            " Use shiftwidth to tab at line beginning
set wrap                " Wrap text inside screen
set linebreak           " Wrap words, not characters
set linespace=4         " Baseline spacing, measured in pixels
set foldmethod=indent   " Fold using indentation
set foldlevelstart=20   " Do not fold by default
set tildeop             " Tilde is an operator (i.e., can be used with modifiers)

" Search functionality
set hlsearch            " Highlight search results
set incsearch           " Incremental search
set ignorecase          " Ignore search case
set smartcase           " ... unless uppercase letters are explicit

" Project functionality
set exrc                " Per-directory .vimrc 
set secure              " Required for exrc

" Navigation
set autochdir           " Automatically change directory; useful with vim <directory> and

if has('nvim')
  " Where Neovim has better capabilities, I'll turn them on here
  set fillchars=eob:\   " Remove tildes from blank lines 
  " set cmdheight=0       " Do not show command line or output except when being used
else
  " Placeholder for Vim-only config that isn't necessary in Neovim
endif

if has('unix') || has('mac')
  set directory=/tmp    " Don't store swap files next to working text
end

autocmd FocusLost * silent! wall
