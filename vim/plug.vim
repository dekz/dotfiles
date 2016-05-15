set nocompatible
filetype off                   " required!

call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-fugitive'
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
"
Plug 'milkypostman/vim-togglelist'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
"" Bdelete
Plug 'moll/vim-bbye'
"
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'edkolev/tmuxline.vim'
"Plug 'skalnik/vim-vroom'

" {{{
" :Files :Commits :Buffers
" }}}
set rtp+=~/.fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ntpeters/vim-better-whitespace'

Plug 'luochen1990/rainbow'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'

Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'

Plug 'tpope/vim-vinegar'

" {{{
" bar if foo?
" * gS to split a one-liner into multiple lines
" * gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
" }}}
Plug 'AndrewRadev/splitjoin.vim'

Plug 'scrooloose/syntastic'

Plug 't9md/vim-choosewin'
Plug 'kshenoy/vim-signature'

call plug#end()

set omnifunc=syntaxcomplete#Complete

filetype plugin indent on     " required!
