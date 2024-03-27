" Plugins.vim - Configuration for all plugins

let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=20
let g:NERDTreeDirArrows=1
let g:NERDSpaceDelims=1               " Add a space before comments
let g:NERDTreeChDirMode=2             " Automatically change working directory
let g:NERDTreeIgnore = [
      \ '^.gems$',
      \ '^tags$',
      \ '^target$',
      \ '^node_modules$',
      \ '^tmp$',
      \ '^log$',
      \ '^logs$',
      \ '^__pycache__$',
      \ '*\.pyc$',
      \ '**/*\.pyc$',
      \ 'Icon*'
      \ ]

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:ctrlp_working_path_mode=0
let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Make NERDTree cursor line bold rather than underlining (in Neovim)
highlight CursorLine term=bold cterm=bold ctermbg=none  ctermfg=none gui=bold

" Actively correct Javascript, do not actively correct HTML
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': ['html', 'sass', 'scss', 'scss.css', 'python', 'java'] 
      \ }

let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0
let g:pymode_lint = 0

let g:goyo_width = 100
let g:goyo_height = '90%'

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
