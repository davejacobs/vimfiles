" .gvimrc - GUI customization for GVim and MacVim

set guioptions=         " Reset options
set guioptions+=i       " Show Vim icon in taskbar
set guioptions+=e       " Show native GUI tabs
set guioptions-=a       " Remove autoselect, which automatically copies selected text into memory
set guioptions-=A       " Remove autoselect, which automatically copies selected text into memory
set guioptions-=m       " Remove menu bar
set guioptions-=T       " Remove toolbar
set guioptions-=l       " Remove left scrollbar
set guioptions-=r       " Remove right scrollbar
set guioptions-=b       " Remove bottom scrollbar

set linespace=6
" set transparency=5
" set blur=10

" Don't show tildes
hi NonText guifg=bg

autocmd BufEnter * highlight Search gui=underline
