set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'mileszs/ack.vim'

Plugin 'joshdick/onedark.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'mengelbrecht/lightline-bufferline'

Plugin 'preservim/nerdtree'

Plugin 'neoclide/coc.nvim'
Plugin 'dart-lang/dart-vim-plugin'

Plugin 'takac/vim-hardtime'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
colorscheme onedark

" Use the_silver_searcher instead of ack.
" https://github.com/ggreer/the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

inoremap jj <ESC>
let mapleader = "'"

" Use space in normal mode.
nnoremap <space> i<space><esc>

" turn relative line numbers on
set relativenumber
set rnu

set number
set noswapfile
set hlsearch
set showtabline=2
set ignorecase
set incsearch
set laststatus=2
set autochdir

" Indentation
set sts=2
set smartindent
set autoindent
set ts=2
set sw=2
set et

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv 
vnoremap <A-k> :m '<-2<CR>gv=gv

" Disable arrow keys for all modes.
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor

" Save file
nnoremap <Leader>s :update<CR>
vnoremap <Leader>s <C-C>:update<CR>
inoremap <Leader>s <C-O>:update<CR>

" Clear search highlight
:noremap <C-l> :nohls<CR><c-l>

" Reload file
:noremap <Leader>e :edit!<CR>

" FZF keybindings
nnoremap <silent> <leader>f :ProjectFiles<CR>
nnoremap <silent> <leader><space> :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>t :Tags<CR>

nnoremap <silent> <leader>? :History<CR>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
" FZF keybindings end

" Dart and Flutter Key Bindings
nnoremap <Leader>fh :CocCommand flutter.dev.hotRestart<CR>
nnoremap <Leader>fr :CocCommand flutter.run<CR>
nnoremap <Leader>fd :CocCommand flutter.devices<CR>

" List buffer in tabline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.colorscheme      = 'one'

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

" Use 'a' to navigate between windows
nnoremap aj <C-W>j
nnoremap ak <C-W>k
nnoremap al <C-W>l
nnoremap ah <C-W>h

" Hard time https://github.com/takac/vim-hardtime
let g:hardtime_default_on = 1
