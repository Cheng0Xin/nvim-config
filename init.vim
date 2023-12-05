" ---------------------------
" Won't change any more part
" ---------------------------
set nocompatible           " disable compatibility to old-time vi
set showmatch              " show matching
set hlsearch
set incsearch
set expandtab
set autoindent
set number relativenumber
set cc=80
set ttyfast
set noswapfile

set tabstop=2
set softtabstop=2
set shiftwidth=2

autocmd Filetype cs setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

set completeopt=longest,menuone " Normal complete option

syntax on
filetype plugin on
filetype plugin indent on

" Plugin
lua require('plugins')
" lua require('mini.trailspace').setup()
" "lua require('mini.completion').setup()
lua require('mini.surround').setup()
lua require('mini.jump').setup()
lua require('mini.jump2d').setup()
lua require("autoclose").setup()
lua require('details')

" Keymapping
lua require('keymapping')

" lsp
lua require('lsp')

" Dev section
lua require('tools')
command! Swicth lua require('tools').getCurColor()

" Theme related
lua require('color')
