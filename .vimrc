" **** vim-plug package manager ****
call plug#begin('~/.vim/plugged')

Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-sensible'
Plug 'ajh17/VimCompletesMe'
Plug 'ggreer/the_silver_searcher'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/Gundo'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/matchit.zip'
"Plug 'Shougo/neocomplcache'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/NSIS-syntax-highlighting'
Plug 'myusuf3/numbers.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'vim-scripts/Rename'
Plug 'vim-scripts/ruby-matchit'
Plug 'ervandew/supertab'
Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jdonaldson/vim-cheat'
Plug 'tpope/vim-classpath'
Plug 'guns/vim-clojure-static'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"Plug 'vim-scripts/YankRing.vim'
Plug 'jnurmine/Zenburn'
Plug 'duythinht/vim-coffee'
Plug 'vim-scripts/desertEx'
Plug 'gosukiwi/vim-atom-dark'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'fugalh/desert.vim'
Plug 'twerth/ir_black'

call plug#end()

" Disable parallel plugin install on Windows
if has('win32') || has('win64')
  let g:plug_threads = 1
endif

" **** global config ****

" Use 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" Cursor highlights
set cursorline
hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=NONE

" Searching
set hlsearch  " highlight search
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase
nnoremap <silent> <C-l> :nohl<CR><C-l>

"" Line Wrapping
"set nowrap
"set linebreak  " Wrap at word

" Make cursor move by visual lines instead of file lines (when wrapping)
map k gk
map j gj
map E ge

" Hard to type
imap hh =>

" Recognize md file extension as mardown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"" Omni Completion
"autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"" May require ruby compiled in
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 

"set nocompatible              " be iMproved, required
"syntax on
"filetype off                  " required

"set encoding=utf8
"set fileencoding=utf8
"set fileencodings=ucs-bom,utf8,latin1,prc

" Escape with jj
inoremap jj <Esc>

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
set relativenumber

" Turn off sound
set vb
set t_vb=

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

" Move cursor to next editor row if paragraph is wrapped
nnoremap j gj
nnoremap k gk

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

"" *********** Plugin config **************

" **** CtrlP ****
" c-y open new files in tab
" c-z & c-o open files in new tabs and jump to first opened
let g:ctrlp_map = '<c-p>'  
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tj'
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*

" Enable pymatcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" **** numbers.vim ****
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" **** vim-airline ****
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" **** DISABLED STUFF ****

"" **** Autocomplcache ****
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"" Plugin key-mappings.
"inoremap <expr><C-z>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  "" For no inserting <CR> key.
  ""return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion using supertab
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-c>  neocomplcache#cancel_popup()

"" **** Powerline ****
"" Enable vim-powerline
"let g:Powerline_symbols = 'fancy'
"" Enable powerline
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"" **** YankRing.vim ****
"" Press F2 to show YankRing buffer
"nnoremap <silent><F2> :YRShow<CR>

"" **** Local settings ****
"if filereadable(expand("~/.vimrc.local"))
  "source ~/.vimrc.local
"endif
