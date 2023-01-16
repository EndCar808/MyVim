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

" Git Related plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" AAirline 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sheerun/vim-polyglot'

Plug 'dense-analysis/ale'

" NerdTTree
Plug 'preservim/nerdtree'

" Vim snippets
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'

"  Latex Packages
Plug 'lervag/vimtex'

Plug 'easymotion/vim-easymotion'     " go to any word quickly '\\w', '\\e', '\\b'

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

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" Set the path to the snippets directory
 let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"Set line number on
set number
set relativenumber
set nu

" Set Gitgutter update time
set updatetime=1000


" lightline 
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


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

set encoding=utf-8

" Enabling filetype detection for ftplugin
filetype on             " enable filetype detection
filetype plugin on      " load file-specific plugins
filetype indent on      " load file-specific indentation


" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
