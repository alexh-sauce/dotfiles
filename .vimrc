set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
" Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
" Plugin 'maralla/completor.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'fatih/vim-go'
Plugin 'jamessan/vim-gnupg'
Plugin 'romainl/vim-qf'


call vundle#end()

filetype plugin indent on    " required

let g:ale_python_auto_pipenv = 1
let g:ale_fix_on_save = 1

let b:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['black', 'isort', 'add_blank_lines_for_python_control_statements']
\}

let g:syntastic_check_on_open = 1
" Don’t check when the file is saved
let g:syntastic_check_on_wq = 0

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

highlight link BadWhitespace Error
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

set number relativenumber

set bg=dark
set ignorecase
set smartcase
set incsearch

set wildmode=longest,list,full
set wildmenu

set hlsearch
set laststatus=2

set autowrite                  " automatically write a file when leaving a modified buffer

set lazyredraw          " redraw only when we need to.

let python_highlight_all=1
syntax on
