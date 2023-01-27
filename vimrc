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
" Fuzzy Seearch
Plug 'junegunn/fzf'
" Vim snippets
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'

Plug 'goerz/jupytext.vim'
"  Latex Packages
Plug 'lervag/vimtex'

Plug 'easymotion/vim-easymotion'     " go to any word quickly '\\w', '\\e', '\\b'
Plug 'yuttie/comfortable-motion.vim' " Nice Scrolling using <C-u> and <C-d>
Plug 'mhinz/vim-startify'            " Opens vim with a start menu of recent edited files etc
" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""
" Color Scheme
" Colour Scheme Options
let g:onedark_hide_endofbuffer = 0
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:airline_theme='onedark'
" Set the colour scheme
syntax on
colorscheme onedark


""""""""""""""""""""""""""""""""""
" Window Splits
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"""""""""""""""""""""""""""""""""""
" Python Interpretor Creation 
" Start terminals for Python sessions '\tp'
map <Leader>tpy :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k

""""""""""""""""""""""""""""""""""
" Ultisnips
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


"""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""
" startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]


""""""""""""""""""""""""""""""""
" Vimtex
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","



"""""""""""""""""""""""""""""""""
" General settings
"Set line number on
set number
set relativenumber
set nu

set mouse=a " Turn on mouse actions - needed for comfortable motions scrolling of mouse wheel

" Set Gitgutter update time
set updatetime=1000

" tabs and spaces
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Uses shiftwidth and tabstap to insert blanks when <Tab>
set shiftwidth=2                " One tab == four spaces.
set tabstop=2                   " One tab == four spaces.<Paste>

" Searching options
set nohlsearch
set ignorecase
set smartcase
set incsearch

" Buffer options
set hidden

set noerrorbells
set termguicolors
set scrolloff=50

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

