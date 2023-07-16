" .gvimrc - GUI customization for GVim and MacVim

" Best choices: solarized, toychest, github, flatui, monokai, cobalt2, PaperColor, gravity
" colorscheme github
" colorscheme PaperColor

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

if has("gui_gtk2")
  set guifont=Ubuntu\ Mono\ 11
elseif has("gui_macvim")
  set guifont=Monaco:h13

  " Delete MacVim key bindings before reusing
  " macmenu &Edit.Find.Find\.\.\. key = <nop>
  macmenu &Edit.Find.Find… key = <nop>
  
  macmenu &Edit.Find.Use\ Selection\ for\ Find key = <nop>
  macmenu &File.Print key = <nop>
  macmenu &File.Save\ As… key = <nop>
endif

autocmd BufEnter * highlight Search gui=underline
