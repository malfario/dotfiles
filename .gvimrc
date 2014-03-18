set background=dark
colorscheme zenburn
set guifont=Anonymous_Pro_for_Powerline:h11

" Highlight line of cursor
set cursorline

if filereadable(expand("~/.gvimrc-local"))
  source ~/.gvimrc-local
endif
