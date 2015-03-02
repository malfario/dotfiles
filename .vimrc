" **** vim-plug package manager ****
" https://github.com/junegunn/vim-plug

if has('win32') || has('win64')
  let g:plug_threads = 1 " Disable parallel plugin install on Windows 
  let plugdir = '~/vimfiles/plugged'
else
  let plugdir = '~/.vim/plugged'
endif

call plug#begin(plugdir)

Plug 'embear/vim-localvimrc'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" Plug 'Shougo/neocomplete.vim'
Plug 'klen/python-mode'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'amdt/vim-niji', { 'for': 'clojure' }
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
Plug 'tpope/vim-commentary'
"Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/NSIS-syntax-highlighting'
Plug 'myusuf3/numbers.vim'
"Plug 'vim-scripts/paredit.vim'
Plug 'vim-scripts/Rename'
Plug 'vim-scripts/ruby-matchit'
Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'MattesGroeger/vim-bookmarks'
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
Plug 'jnurmine/Zenburn'
Plug 'duythinht/vim-coffee'
Plug 'vim-scripts/desertEx'
Plug 'gosukiwi/vim-atom-dark'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'fugalh/desert.vim'
Plug 'twerth/ir_black'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

call plug#end()

" **** global config ****

" Set leader key
"let mapleader="\<Space>"
let mapleader=","
let maplocalleader=","

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

" Disable folds temporarily when opening a file.
" Use `zc` or `zi` to restore folding.
set nofoldenable

"" Line Wrapping
"set nowrap
"set linebreak  " Wrap at word

" Hard to type
imap hh =>

" Recognize md file extension as mardown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Force encoding in Windows console vim 
if (has('win32') || has('win64')) && !has('gui_running')
  set encoding=utf8
  "set fileencoding=utf8
  "set fileencodings=ucs-bom,utf8,latin1,prc
endif

" Escape with jj
inoremap jj <Esc>

" Disable autocomments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if has('unix')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
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
if has('unix')
  cnoremap w!! w !sudo tee % >/dev/null
endif

" Move cursor to next editor row if paragraph is wrapped
nnoremap j gj
nnoremap k gk
nnoremap E ge

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

if has('win32') || has('win64')
  set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'dir %s /-n /b /s /a-d']
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

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
if has('unix') || has('gui_running')
  let g:airline_powerline_fonts = 1
endif
let g:airline#extensions#tabline#enabled = 1

" **** python-mode ****
" Load .lvimrc per project through vim-localrc plugin.

" **** VimCompletesMe ****
autocmd FileType clojure let b:vcm_tab_complete = "user"

" **** BufferGator ****
let g:buffergator_viewport_split_policy = 'T' "Open on top split

" **** NERDTree-Tabs ****
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" **** Unite ****
nnoremap <Leader>b :Unite buffer<CR>
nnoremap <Leader>B :UniteClose<CR>

" **** vim-nerdtree-tabs ****
let g:nerdtree_tabs_open_on_gui_startup = 0

" **** neocomplete *****
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"" Define dictionary.
""let g:neocomplete#sources#dictionary#dictionaries = {
    ""\ 'default' : '',
    ""\ 'vimshell' : $HOME.'/.vimshell_hist',
    ""\ 'scheme' : $HOME.'/.gosh_completions'
    ""\ }

"" Define keyword.
""if !exists('g:neocomplete#keyword_patterns')
    ""let g:neocomplete#keyword_patterns = {}
""endif
""let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  "" For no inserting <CR> key.
  ""return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction

"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
