set rtp+=~/.vim
source ~/.vimrc
au VimEnter * colorscheme solarized
set background=dark

inoremap ï <ESC>o
inoremap Ï <ESC>O
inoremap » <ESC>:

" **** Nim stuff
" TODO:
" Reuse scratch buffer: https://github.com/vim-scripts/scratch.vim/blob/master/plugin/scratch.vim

function! s:NimCompileHandler(job_id, data, event)
  call append(0, a:data)
endfunction

function! s:OpenScratch(height)
  exe a:height.'split' tempname()
  setl buftype=nofile bufhidden=wipe nobuflisted noswapfile
endfunction

function! s:NimCompile(filename, args)
  let s:callbacks = {
  \   'on_stdout': function('s:NimCompileHandler'),
  \   'on_stderr': function('s:NimCompileHandler')
  \ }
  let l:cmd = add(['nim', 'c', a:args], a:filename)
  let job1 = jobstart(l:cmd, s:callbacks)
  call s:OpenScratch('20%')
endfunction

command! NimCompileFile call s:NimCompile(expand('%'), '')
command! NimCompileRunFile call s:NimCompile(expand('%'), '-r')

nnoremap <silent> <f7> :NimCompileFile<cr>
nnoremap <silent> <f5> :NimCompileRunFile<cr>
