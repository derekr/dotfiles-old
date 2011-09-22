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
Bundle 'https://github.com/fholgado/minibufexpl.vim.git'
Bundle 'https://github.com/scrooloose/nerdcommenter.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
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

" use left and right in normal mode to change buffers
noremap <Left> :bp<cr>
noremap <Right> :bn<cr>

" GUI Settings {
	" GVIM- (here instead of .gvimrc)
	if has('gui_running')
		set guioptions-=T          	" remove the toolbar
		set guifont=AndaleMono:h14
    "Remove all bells - this needs to be moved to .gvimrc
    set vb t_vb=

		"set transparency=5          " Make the window slightly transparent

    "minibuf options
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
    let g:miniBufExplorerMoreThanOne = 0
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplMapWindowNavVim = 1
	else
		set term=builtin_ansi       " Make arrow and other keys work
	endif
" }

" cut/paste to/from clipboard
map <C-V> "+gP
cmap <C-V> <C-R>+
vnoremap <C-C> "+y

nnoremap ; :

au FocusLost * :wa
