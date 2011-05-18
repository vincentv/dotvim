let php_sql_query = 1       "Coloration des requetes SQL
let php_baselib = 1
let php_htmlInStrings = 1   "Coloration des balises html
let php_noShortTags = 1
let php_folding = 1

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufRead *.php set ft=php

" ---- Jelix
autocmd BufRead *.ini.php, *.ini.php.dist) set ft=dosini
autocmd BufRead *.tpl set ft=html

