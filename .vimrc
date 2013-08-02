" Load vim plugins
execute pathogen#infect()
syntax on
filetype plugin indent on

" Use tmux in screen.vim
let g:ScreenImpl = 'Tmux'

" Hit return to clean highlighting after search
nnoremap <CR> :noh<CR><CR>

" Escape with jj
inoremap jj <Esc>

" Local settings
if filereadable(expand("~/.vimrc-local"))
  source ~/.vimrc-local
endif

" Create parent dirs for new file
augroup BWCCreateDir
  au!
  autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

" Disable autocomments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Turn on line numbers
set number

" Turn off sound
set vb
set t_vb=

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" **** Command-line mode key mappings ****
" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

" **** Insert mode key mappings ****
" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A

" Ctrl-a: Go to begin of line
inoremap <c-a> <esc>I

" Ctrl-j: Move cursor up
inoremap <expr> <c-j> pumvisible() ? "\<C-e>\<Down>" : "\<Down>"

" Ctrl-k: Move cursor up
inoremap <expr> <c-k> pumvisible() ? "\<C-e>\<Up>" : "\<Up>"

" Ctrl-f: Move cursor left
inoremap <c-f> <Left>

" Ctrl-g: Move cursor right
" Disable Surround.vim experimental insert mode mappings to avoid clashes
silent! iunmap <C-G>s
silent! iunmap <C-G>S
inoremap <c-g> <Right>

" Show tabnumber and modified state
set tabline=%!MyTabLine()
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " select the highlighting for the buffer names
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " empty space
    let s .= ' '
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0 " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
        "let n .= bufname(b)
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add buffer names
    if n == ''
      let s .= '[No Name]'
    else
      let s .= n
    endif
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      "let s .= '[' . m . '+]'
      let s.= '*'
    endif
    " switch to no underlining and add final space to buffer list
    "let s .= '%#TabLineSel#' . ' '
    let s .= ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif
  return s
endfunction

" **** Autocomplcache ****
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
inoremap <expr><C-z>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion using supertab
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-c>  neocomplcache#cancel_popup()

" Enable vim-powerline
let g:Powerline_symbols = 'fancy'

" Enable powerline
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" **** ctrlp ****
" c-y open new files in tab
let g:ctrlp_open_new_file = 't'
" c-z & c-o open files in new tabs and jump to first opened
let g:ctrlp_open_multiple_files = 'tj'
