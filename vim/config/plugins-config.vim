" Plugins.vim - Configuration for all plugins

let g:ctrlp_working_path_mode=0
let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=20
let g:NERDTreeDirArrows=1
let g:NERDSpaceDelims=1               " Add a space before comments
let g:NERDTreeChDirMode=2             " Change working directory 
                                      " when appropriate
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

" Actively correct Javascript, do not actively correct HTML
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': ['html', 'sass', 'scss', 'scss.css', 'python', 'java'] 
      \ }

let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0
let g:pymode_lint = 0

" call tcomment#DefineType('js', '// %s')
call tcomment#DefineType('soar', '# %s')

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

let g:sqlutil_align_comma = 1
let g:sqlutil_align_first_word = 1

" How many lines the parser scans for matching delimiters 
let g:clojure_maxlines = 150

" Align strings the pretty way
let g:clojure_align_multiline_strings = 1

" Indentation configuration
let g:clojure_fuzzy_indent_patterns = [
      \ '^do',
      \ '^with',
      \ '^def',
      \ '^or',
      \ '^and',
      \ '^let',
      \ '^select',
      \ '^insert',
      \ '^create',
      \ '^update',
      \ '^delete',
      \ '^before',
      \ '^before-all',
      \ '^after',
      \ '^after-all',
      \ '^around',
      \ '^describe',
      \ '^it',
      \ '^ANY',
      \ '^GET',
      \ '^POST',
      \ '^PUT',
      \ '^PATCH',
      \ '^DELETE',
      \ '^OPTIONS',
      \ '^table',
      \ '^drop',
      \ '^fact',
      \ '^->',
      \ '^dom',
      \ '^did',
      \ '^will',
      \ '^render'
      \ ]

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#autoformat = 1
let g:pencil#textwidth = 100

augroup emmet_group
  autocmd FileType html,css,javascript.jsx EmmetInstall
augroup END

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,md,mkd call pencil#init()
augroup END
