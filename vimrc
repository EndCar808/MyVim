" Auto load vim-plug on start up
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" OneDark Colorscheme Plugin
Plug 'joshdick/onedark.vim'

Plug 'airblade/vim-gitgutter'

" AAirline 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sheerun/vim-polyglot'

" NerdTTree
Plug 'preservim/nerdtree'

" Initialize plugin system
call plug#end()

" Colour Scheme Options
let g:onedark_hide_endofbuffer = 0
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:airline_theme='onedark'

" Set the colour scheme
syntax on
colorscheme onedark


"Set line number on
set number
set relativenumber
set nu

" Searching options
set nohlsearch
set ignorecase
set smartcase
set incsearch

" Buffer options
set hidden

set noerrorbells
set termguicolors
set scrolloff=10

set signcolumn=yes
