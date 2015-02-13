" Color scheme
set background=dark
colorscheme zenburn

" Remove toolbar
set go-=T

" Default window size
set columns=179 
set lines=50

" OS Specific
if has("gui_macvim")

  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  set guifont=Anonymice_Powerline:h11
  "set stal=2 " turn on tabs by default

  " Command-Option-ArrowKey to switch viewports
  aunmenu Window.Select\ Next\ Tab
  aunmenu Window.Select\ Previous\ Tab
  map <D-M-Up> <C-w>k
  imap <D-M-Up> <Esc> <C-w>k
  map <D-M-Down> <C-w>j
  imap <D-M-Down> <Esc> <C-w>j
  map <D-M-Right> <C-w>l
  imap <D-M-Right> <Esc> <C-w>l
  map <D-M-Left> <C-w>h
  imap <D-M-Left> <C-w>h

elseif has("gui_gtk2")

  set guifont=Monaco
  set guioptions-=T  " remove toolbar

elseif has("x11")
elseif has("gui_win32")
  "set guifont=DejaVu_Sans_Mono_for_Powerline:h8
  set guifont=Powerline_Consolas:h9
  set anti " Antialias font
end
