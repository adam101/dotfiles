syntax on
set winminheight=0
set tabstop=2
set shiftwidth=2
set sts=2
set et
set number

map <C-K> <C-W>k<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-P> :resize 20<CR>
map <F2> :set list <CR> :set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< <CR>
map <F3> :set nolist <CR>
map <F8> :setl noai nocin nosi inde=<CR>

autocmd FileType ruby nnoremap <buffer> <silent> <f5> :!ruby %:p<cr>

filetype indent on

set clipboard=unnamedplus

" searching
set hlsearch
set ignorecase
set smartcase

" status bar info
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\
set laststatus=2
set cmdheight=1

" ultimate vimconfig
let g:Powerline_symbols = 'unicode'
set mouse=a
call pathogen#infect()

autocmd BufWritePre * :call StripWhitespaces() " remove trailing whitespaces on save

function! StripWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
