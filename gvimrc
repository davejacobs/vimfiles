" .gvimrc - GUI customization for GVim and MacVim

set guioptions=         " Reset options
set guioptions+=i       " Show Vim icon in taskbar
set guioptions+=e       " Show native GUI tabs
set guioptions-=a       " Remove autoselect
set guioptions-=A       " Remove autoselect
set guioptions-=m       " Remove menu bar
set guioptions-=T       " Remove toolbar
set guioptions-=l       " Remove left scrollbar
set guioptions-=r       " Remove right scrollbar
set guioptions-=b       " Remove bottom scrollbar
set visualbell t_vb=    " Get rid of that annoying error beep & flash
set linespace=4

autocmd BufEnter * highlight Search gui=underline

if has("gui_gtk2")
  set guifont=Ubuntu\ Mono\ 11

  map <C-f>           :Ag! ""<Left>

  " Conveniently access config files
  nmap <Leader>cv         :edit $MYVIMRC<CR>
  nmap <Leader>cg         :edit $MYGVIMRC<CR>
  nmap <Leader>ca         :edit ~/.vim/config/basic.vim<CR>
  nmap <Leader>cb         :edit ~/.vim/config/plugins.vim<CR>
  nmap <Leader>cf         :edit ~/.vim/config/functions.vim<CR>
  nmap <Leader>ck         :edit ~/.vim/config/keybindings.vim<CR>
  nmap <Leader>cp         :edit ~/.vim/config/plugins-config.vim<CR>

  vmap <C-c>          "+y

elseif has("gui_macvim")
  set guifont=Monaco:h13

  " Delete MacVim key bindings before reusing
  macmenu &Edit.Find.Find\.\.\. key = <nop>
  macmenu &File.Print key = <nop>
  macmenu &File.Save\ As\.\.\. key = <nop>

  " Conveniently access config files
  nmap <D-O>          :source %<CR>
  nmap <D-<>          :edit $MYVIMRC<CR>
  nmap <D->>g         :edit $MYGVIMRC<CR>
  nmap <D->>a         :edit ~/.vim/config/basic.vim<CR>
  nmap <D->>p         :edit ~/.vim/config/plugins.vim<CR>
  nmap <D->>pc        :edit ~/.vim/config/plugins-config.vim<CR>
  nmap <D->>f         :edit ~/.vim/config/functions.vim<CR>
  nmap <D->>k         :edit ~/.vim/config/keybindings.vim<CR>

  map <D-f>           :Ag! ""<Left>

  " Access CtrlP, NERDTree, NERDCommenter
  map <D-N>           :CtrlPMixed<CR>
  map <D-e>           :Eval<CR>
  map <D-g>           :Gstatus<CR>
  map <D-n>           :NERDTreeToggle<CR>
  map <D-/>           :TComment<CR>

  vmap <D-p>           :!par<CR>
  nmap <D-p>           vip!par<CR>

  " Copy current file path to system pasteboard
  nmap <D-C>          :call CopyPathWithLine()<CR>
end

" Best choices: solarized, toychest, github, flatui, monokai, cobalt2
colorscheme solarized
set background=light

" Don't show tildes
hi NonText guifg=bg
