setlocal spell spelllang=en_us " Spell check
setlocal spellcapcheck=        " Turn off capitalization checking, it doesn't work
                               " in many cases, like after "vs." 
setlocal nosmartindent
setlocal cinoptions=           " Turn off programmer indentation
setlocal nonumber
setlocal nocindent             " C-style autoindenting
setlocal nosmarttab            " Use shiftwidth to tab at line beginning
setlocal tabstop=4
setlocal shiftwidth=4

" Move up and down using apparent lines,
" not real ones
nmap j gj
nmap k gk
vmap j gj
vmap k gk
