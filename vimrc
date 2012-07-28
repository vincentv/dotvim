" vim:fdm=marker

set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype indent plugin on

" Main {{{
syntax on                   " Enable syntax highlighting
set mouse=a                 " Enable use of the mouse for all modes

" Encoding and Format {{{2
set encoding=UTF-8
set fileencodings=UTF-8
set fileformats=unix
" }}}2

" Text indent {{{2
set autoindent              " automatic indent new lines
set smartindent
set softtabstop=2           "
set shiftwidth=2            "
set tabstop=2
set expandtab               " expand tabs to spaces
set nosmarttab              " fuck tabs
" }}}2

" Search  {{{2
set incsearch               " do incremental searching
set ignorecase              " ignore case when searching
set hlsearch                " highlight searches
set smartcase
" }}}2

" Spell {{{2
set spl=fr,en               " utiliser le franÃ§ais et l'anglais pour la correction orthographique
set sps=best,10             " afficher seulement les 10 meilleures propositions pour la correction orthographique
set nospell                 " pas de correction orthographique par dÃ©faut
" }}}2

" History {{{2
set history=100             " lots of command line history
" }}}2

" Backups {{{2
set nowritebackup           " do not keep a backup while working
set noswapfile              " don't keep swp files either
" }}}2

" }}}

" UI {{{
set ruler                  " show the cursor position all the time
set number                 " line numbers
set nowrap                 " do not wrap lines

set showcmd                " display incomplete commands
set showmatch              " brackets/braces that is

set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set list listchars=trail:.,tab:>.   " Highlight Trailing Whitespace

set t_Co=256
set background=dark
colorscheme molokai
set guifont=Inconsolata
" }}}

" Filetypes {{{
au BufRead,BufNewFile nginx.*,nginx/**/*                                    set ft=nginx
au BufRead,BufNewFile Gemfile,Capfile,Vagrantfile,Guardfile,*.thor          set ft=ruby
au BufRead,BufNewFile Xdefaults                                             set ft=xdefaults
au BufRead,BufNewFile *.{md,mkd,markdown}                                   set ft=markdown spell
au BufRead,BufNewFile *.{txt}                                               set ft=txt      spell
au BufRead,BufNewFile README,INSTALL,ChangeLog                              set ft=txt      spell
au BufRead,BufNewFile *.sass                                                set ft=sass
au BufRead,BufNewFile *.scss                                                set ft=scss
au BufRead,BufNewFile *.mustache                                            set ft=mustache
au BufRead,BufNewFile *.{handlebars,hbs}                                    set ft=handlebars
au BufRead,BufNewFile *.{jst,ejs,tpl}                                       set ft=html
au BufRead,BufNewFile *.coffee,Cakefile                                     set ft=coffee           ts=2 st=2 sw=2
au BufRead,BufNewFile *.ics,*.ical                                          set ft=icalendar
au BufRead,BufNewFile *.php                                                 set ft=php              ts=4 st=4 sw=4
au BufRead,BufNewFile {*.ini.php,*.ini.php.dist}                            set ft=dosini

set omnifunc=syntaxcomplete#Complete
" }}}

" Plugin config {{{
" PHP {{{2
let php_sql_query       = 1   "Coloration des requetes SQL
let php_baselib         = 1
let php_htmlInStrings   = 1   "Coloration des balises html
let php_noShortTags     = 1
let php_folding         = 1
" }}}2

" (x)HTML {{{2
let html_use_css        = 1   "Export HTML
let use_xhtml           = 1
" }}}2

" }}}

"  Mapping {{{

let mapleader = ","               " remap <LEADER> to ',' (instead of '\')
let g:mapleader = ","

nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap <Leader>= :call Preserve("normal gg=G")<CR>

command W w !sudo tee % > /dev/null

" }}}

" Functions {{{
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Do the business:
  execute a:command

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Automatically give executable permissions if file begins with #! and contains '/bin/' in the path
function MakeScriptExecuteable()
  if getline(1) =~ "^#!.*/bin/"
    silent !chmod +x <afile>
  endif
endfunction

" }}}

" Supprime les espaces en fin de ligne avant de sauver
au BufWritePre * silent! %s/[\r \t]\+$//
au BufReadPost * call MakeScriptExecuteable()
au BufWritePost .vimrc so ~/.vimrc

runtime! config/**/*.vimrc
