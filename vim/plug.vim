set nocompatible
filetype off                   " required!

call plug#begin('~/.nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'unblevable/quick-scope'
Plug 'moll/vim-bbye'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby'
Plug 'duggiefresh/vim-easydir'

" {{{
" :Files :Commits :Buffers
" }}}
set rtp+=~/.fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-peekaboo'

Plug 'ntpeters/vim-better-whitespace'

Plug 'luochen1990/rainbow'
Plug 'terryma/vim-expand-region'

Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'

" {{{
" bar if foo?
" * gS to split a one-liner into multiple lines
" * gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
" }}}
Plug 'AndrewRadev/splitjoin.vim'

Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }

Plug 't9md/vim-choosewin'
Plug 'kshenoy/vim-signature'

call plug#end()

set omnifunc=syntaxcomplete#Complete

filetype plugin indent on     " required!
