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
Plugin 'luochen1990/rainbow'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'qpkorr/vim-bufkill'
Plugin 'justinmk/vim-sneak'

Plugin 'preservim/nerdtree'

Plugin 'neoclide/coc.nvim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'derekwyatt/vim-scala'

Plugin 'takac/vim-hardtime'
Plugin 'easymotion/vim-easymotion'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
colorscheme onedark

" https://github.com/ggreer/the_silver_searcher
" The Silver Searcher
if executable('ag')
  " Use ag over ack.
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

inoremap jj <ESC>
let mapleader = "'"

" turn relative line numbers on
set relativenumber
set rnu

set number
set noswapfile
set nohlsearch
set showtabline=2
set ignorecase
set incsearch
set laststatus=2
set cursorline
" set autochdir
set tags=/Users/oerdogmus/workspace/tags

" Indentation
set sts=2
set smartindent
set autoindent
set ts=2
set sw=2
set et

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

" Use 'a' to navigate between windows
nnoremap <Leader>aj <C-W>j
nnoremap <Leader>ak <C-W>k
nnoremap <Leader>al <C-W>l
nnoremap <Leader>ah <C-W>h

nnoremap <Leader>co <C-W>o

nnoremap = :vertical resize +10<CR>
nnoremap - :vertical resize -10<CR>

" Hard time https://github.com/takac/vim-hardtime
let g:hardtime_default_on = 1

" Use Shift to navigate more effectively
nnoremap H ^
nnoremap L $
nnoremap J <C-d>
nnoremap K <C-u>

" Search word under cursor in whole project.
nnoremap <Leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Custom utility commands.
command DirSetCurrentFile :cd %:p:h
command OpenVimrc :edit ~/.vimrc
command SourceVimrc :source ~/.vimrc

" Rainbow parentheses active.
let g:rainbow_active = 1

" Indent guides.
let g:indent_guides_enable_on_vim_startup = 1

" Easymotion settings.
let g:EasyMotion_do_mapping = 0
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Sneak settings.
map s <Plug>Sneak_s
map S <Plug>Sneak_S
