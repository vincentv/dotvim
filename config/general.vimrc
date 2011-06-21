
" -------- Editor
" ----------------------------------------------------------------------------

syntax on

" ---- Encoding and Format
set encoding=UTF-8
set fileencoding=UTF-8
set fileformats=unix                  " support these files

" ---- Text indent
set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set softtabstop=4          " yep, 4
set shiftwidth=4           " ..
set tabstop=4
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs

" --------  Search
" ----------------------------------------------------------------------------
set incsearch              " do incremental searching
set ignorecase             " ignore case when searching
set hlsearch               " highlight searches
set smartcase

" -------- Spell
" ----------------------------------------------------------------------------
set spellsuggest=10   "10 suggestion
set spell spelllang=fr
setlocal spell spelllang=fr
set nospell

" -------- History
" ----------------------------------------------------------------------------
set history=100                      " lots of command line history

" -------- Backups
" ----------------------------------------------------------------------------
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
