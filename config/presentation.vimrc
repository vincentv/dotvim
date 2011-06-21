set ruler                  " show the cursor position all the time
set number                 " line numbers
set nowrap                 " do not wrap lines

set showcmd                " display incomplete commands
set showmatch              " brackets/braces that is

set backspace=indent,eol,start     " allow backspacing over everything in insert mode
set list listchars=trail:.,tab:>.   " Highlight Trailing Whitespace


set t_Co=256
colorscheme molokai
set guifont=Inconsolata:h10


" --------  StatusLine
" ----------------------------------------------------------------------------
set laststatus=2           " always show the status line

set statusline=%f
set statusline+=%m                              " Modified file
set statusline+=%r                              " Read only file
" Infos utiles [type,charset,format]
set statusline+=\ [%{strlen(&filetype)?&filetype:'aucun'},%{strlen(&fileencoding)?&fileencoding:&enc},%{&fileformat}]
set statusline+=%=%l,%c%V                       " Position du curseur (ligne, colonne - colonne fictive)
set statusline+=\ %P                            " Percent throught file



