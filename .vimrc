" Configuration file for vim
set modelines=0        " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backspace=2        " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" Alex quality of life stuff begins here

" Color scheme
syntax enable
colorscheme monokai

" Wrap to next line using arrow navigation
set whichwrap+=<,>,h,l,[,]

" tabs are spaces 
set tabstop=2
set softtabstop=2
set expandtab

" line numbers
set number

" Search highlighting as you go!
set incsearch
set hlsearch

" rebind beginning and end of line navigation
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Rebind jj as <ESC>
inoremap jj <esc>

" Color column line set
set colorcolumn=80
