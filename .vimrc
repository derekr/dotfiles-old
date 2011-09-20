set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rails.vim'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'molokai'
Bundle 'https://github.com/nono/github_vim_theme.git'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
             " ...

filetype plugin indent on     " required!

set modelines=0

set background=light
colorscheme solarized
syntax on

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set nu

set noswapfile
set nobackup
set nowritebackup

let mapleader = ","

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

set list
set listchars=tab:▸\ ,eol:¬

nnoremap j gj
nnoremap k gk

nnoremap ; :

au FocusLost * :wa
