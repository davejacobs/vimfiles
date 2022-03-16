" Cd.vim - Where to go on startup

if getcwd() == expand('~')
  if isdirectory(expand('~/Code'))
    cd ~/Code
  elseif isdirectory(expand('~/code'))
    cd ~/code
  endif
endif
