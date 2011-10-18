set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Allow Vundle to manage Vundle
Bundle 'gmarik/vundle'

" Bundles
Bundle 'molokai'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'minibufexpl.vim'
Bundle 'jshint.vim'
Bundle 'tComment'
Bundle 'unimpaired.vim'

filetype plugin indent on

set modelines=0

let mapleader = ","
nnoremap ; :

" Appearance
syntax on
colorscheme molokai
set nu " line numbers

" Tabs, Spaces and Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Misc
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ruler
set laststatus=2
set undofile

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Invisibles
set list
set listchars=tab:▸\ ,eol:¬

" General Movement
set mouse=a
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Control Indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Buffer Navigation
noremap <Left> :bp<cr>
noremap <Right> :bn<cr>

" Splits Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Modes
inoremap jj <ESC>

" Disable Help Key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Autosave On Blur
au FocusLost * :wa

" Custom Commands
" ,W - Strip all whitespace for file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,w - Open new vertical split and switch over to it.
nnoremap <leader>w <C-w>v<C-w>l

" ,a - Use ack
nnoremap <leader>a :Ack

" ,ft - Fold tags (html/xml)
nnoremap <leader>ft Vatzf

" ,v - Select recently pasted text. Helpful for indenting.
nnoremap <leader>v V`]

" ,ev - Quickly open ~/.vimrc in vertical split for quick editing.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" ,c - Comment a selection or line.
map <leader>c <c-_><c-_>

" Plugin Settings
" Command-T
let g:CommandTMaxHeight = 10
