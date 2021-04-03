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

Plugin 'preservim/nerdtree'

Plugin 'neoclide/coc.nvim'
Plugin 'dart-lang/dart-vim-plugin'

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
  exec 'inoremap' key '<Nop>'
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
nnoremap fh :CocCommand flutter.dev.hotRestart<CR>
nnoremap fr :CocCommand flutter.run<CR>
nnoremap fd :CocCommand flutter.devices<CR>
