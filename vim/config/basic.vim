" Basic.vim - Basic Vim options, with thorough comments

set exrc                " Per-project .vimrc 
set secure 
set hidden              " Allow unsaved changes in hidden buffers
set hlsearch            " Highlight search results
set visualbell t_vb=    " Get rid of that annoying error beep & flash
set expandtab           " Use soft tabs
set tabstop=2           " Width of soft tabs
set autoindent 
set shiftwidth=2        " Width of autoindent
set nosmartindent       " Causes problems, esp. with reindenting hashes
set smarttab            " Use shiftwidth to tab at line beginning
set wrap                " Wrap text inside screen
set linebreak           " Wrap words, not characters
set linespace=4         " Baseline spacing, measured in pixels
set number              " Show line numbers
set incsearch           " Incremental search
set ignorecase          " Ignore search case
set smartcase           " ... unless uppercase letters are explicit
set completeopt-=menu   " Bash-like inline completion
set foldmethod=indent   " Fold using indentation
set foldlevelstart=20   " Do not fold by default
set scrolloff=3         " How far away from the edge the cursor initiates scrolling
set tildeop             " Tilde is an operator
set noshowmode          " Do not show current mode (e.g., --INSERT MODE--)
" set textwidth=80        " Consider setting this only for Markdown and text files

set autochdir           " Automatically change directory; useful for vim <directory> and
                        " then exploring in NERDTree
set autoread
set autowriteall        " Save when focus is lost
set statusline=
set clipboard=unnamed

" set cursorline          " Enable cursorline feature, specifically so that I can make
                        " current line bold
highlight CursorLine term=bold cterm=bold ctermbg=none  ctermfg=none gui=bold

let mapleader = " "

if has('unix') || has('mac')
  set directory=/tmp    " Don't store swap files by the originals!
end

autocmd FocusLost * silent! wall
