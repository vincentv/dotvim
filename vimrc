" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype indent on
filetype plugin on

syntax on
set mouse=a

set encoding=UTF-8
set fileencoding=UTF-8
set fileformats=unix                  " support these files

set ruler                  " show the cursor position all the time
set number                 " line numbers
set nowrap                 " do not wrap lines

set showcmd                " display incomplete commands
set showmatch              " brackets/braces that is

set backspace=indent,eol,start
set list listchars=trail:.,tab:>. " Highlight Trailing Whitespace

set t_Co=256
colorscheme molokai
set guifont=Inconsolata:h10

" -------- Spell
set spellsuggest=10   "10 suggestion
set spell spelllang=fr
setlocal spell spelllang=fr
set nospell

" -------- Text Indent
set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set softtabstop=4          " yep, 4
set shiftwidth=4           " ..
set tabstop=4
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs

" -------- Search
set incsearch              " do incremental searching
set ignorecase             " ignore case when searching
set hlsearch               " highlight searches
set smartcase

" -------- History
set history=100                      " lots of command line history

" -------- Backups
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either

" --------  StatusLine
set laststatus=2           " always show the status line

set statusline=%f
set statusline+=%#warningmsg# " Syntastic
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%m                              " Modified file
set statusline+=%r                              " Read only file
" Infos utiles [type,charset,format]
set statusline+=\ [%{strlen(&filetype)?&filetype:'aucun'},%{strlen(&fileencoding)?&fileencoding:&enc},%{&fileformat}]
set statusline+=%=%l,%c%V                       " Position du curseur (ligne, colonne - colonne fictive)
set statusline+=\ %P                            " Percent throught file


" ----------------------------------------------------------------------------
"  Extension
" ----------------------------------------------------------------------------

" -------- global

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Supprime les espaces en fin de ligne avant de sauver
autocmd BufWrite * silent! %s/[\r \t]\+$//

" jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" ---- Mustache
au BufNewFile,BufRead *.mustache        setf mustache

" ----  Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,*.thor,config.ru}    set ft=ruby


" ----------------------------------------------------------------------------
"  Plugins
" ----------------------------------------------------------------------------

" -------- Syntastic
let g:syntastic_enable_signs=1


" -------- Chargement des fichiers de config -------- "
if !exists('config_dir')
    let config_dir = substitute(globpath(&rtp, 'config/'), "\n", ',', 'g')
endif

for $config in split(globpath(config_dir, '*.vim'), "\n")
        source $config
endfor
