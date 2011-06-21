" ---- Mustache
au BufNewFile,BufRead *.mustache        setf mustache

" ----  Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,*.thor,config.ru}    set ft=ruby

" ----  PHP
let php_sql_query = 1       "Coloration des requetes SQL
let php_baselib = 1
let php_htmlInStrings = 1   "Coloration des balises html
let php_noShortTags = 1
let php_folding = 1

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufRead *.php set ft=php

" ---- Jelix
au BufRead,BufNewFile {*.ini.php,*.ini.php.dist}    set ft=dosini
autocmd BufRead *.tpl set ft=html

" -------- XML / (x)HTML
let html_use_css = 1        " export HTML (:TOhtml) *avec CSS*

autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

autocmd BufRead *.html set ft=html

" -------- CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" -------- Javascript (Ecmascript)
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
