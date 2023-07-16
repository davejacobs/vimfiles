" Keybindings.vim - All non-language-specific keybindings

let mapleader=','
let maplocalleader=';'

" kj - the easy way to escape inse;t mode 
inoremap kj <Esc>

" Leader/z - the easy way to fold one level
noremap <Leader>z zMzr

" Run == formatting on the entire file and return to original position
noremap <Leader>= gg=G``

" Get the convenience of 'o' in insert mode
imap <S-CR>     <Esc>o

" Sudo - even if you didn't open the file as root
cmap w!! %!sudo tee > /dev/null %

" Easy splits, navigation, search, buffers & tabs
map <Leader>s  :split<CR>
map <Leader>v  :vsplit<CR>
map <C-j>       <C-w>j
map <C-k>       <C-w>k
map <C-h>       <C-w>h
map <C-l>       <C-w>l

map <Leader>y   :nohls<CR>
vmap <Leader>p  :!par -w 100 <CR>
nmap <Leader>p  vip!par -w 100<CR>
nmap <Leader>P  ggVG!par -w 100<CR>
map Y           y$

" Copy current file path to system pasteboard
map <Leader>C   :call CopyPathWithLine()<CR>

" Edit filetype-specific file
map <Leader>h   :execute "edit " . FiletypeFile()<CR>

autocmd BufWritePre *.js,*.rb,*.py,*.scss,*.md 
      \ call StripTrailingWhitespace()

" Fast search
map <Leader>a :Ag! ""<Left>

" WriteRoom
nnoremap <silent> <leader>z :Goyo<cr>

nmap <Leader>fs :%SQLUFormatter<CR>

" GitHub integration
nmap <D-B>      :Gbrowse<CR>
vmap <D-B>      :Gbrowse<CR>

" Generic tag creator
nmap <Silent> <Leader>t !ctags -R --exclude=.git --exclude=log ./*<CR>

map <C-N>         :CtrlP<CR>
map <C-f>         :Ag! ""<Left>
map <Leader>N     :CtrlP<CR>
map <Leader>e     :CtrlPBuffer<CR>
map <Leader>n     :NERDTreeToggle<CR>
map <Leader>/     :TComment<CR>

map <C-e>         :Eval<CR>
map <Leader>ee    ggVG:Eval<CR>

" Conveniently access config files
nmap <Leader>cv         :edit $MYVIMRC<CR>
nmap <Leader>cg         :edit $MYGVIMRC<CR>
nmap <Leader>cb         :edit ~/.vim/plugins.vim<CR>
nmap <Leader>ca         :edit ~/.vim/config/basic.vim<CR>
nmap <Leader>cc         :edit ~/.vim/config/coc.vim<CR>
nmap <Leader>cf         :edit ~/.vim/config/functions.vim<CR>
nmap <Leader>ck         :edit ~/.vim/config/keybindings.vim<CR>
nmap <Leader>cp         :edit ~/.vim/config/plugins-config.vim<CR>

vmap <C-c>          "+y

if has("gui_macvim")
  map <D-f>           :Ag! ""<Left>

  " Conveniently access config files
  nmap <D-O>          :source %<CR>
  nmap <D-<>          :edit $MYVIMRC<CR>
  nmap <D->>g         :edit $MYGVIMRC<CR>
  nmap <D->>p         :edit ~/.vim/plugins.vim<CR>
  nmap <D->>a         :edit ~/.vim/config/basic.vim<CR>
  nmap <D->>pc        :edit ~/.vim/config/plugins-config.vim<CR>
  nmap <D->>f         :edit ~/.vim/config/functions.vim<CR>
  nmap <D->>k         :edit ~/.vim/config/keybindings.vim<CR>

  " Access CtrlP, NERDTree, NERDCommenter
  map <D-N>           :CtrlPMixed<CR>
  map <D-e>           :Eval<CR>
  map <D-E>           :%Eval<CR>
  map <D-g>           :Gstatus<CR>
  map <D-n>           :NERDTreeToggle<CR>
  map <D-/>           :TComment<CR>

  vmap <D-p>           :!par<CR>
  nmap <D-p>           vip!par<CR>

  " Copy current file path to system pasteboard
  nmap <D-C>          :call CopyPathWithLine()<CR>
end
