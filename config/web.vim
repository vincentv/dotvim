" -------- XML / (x)HTML
let html_use_css = 1        " export HTML (:TOhtml) *avec CSS*

autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

autocmd BufRead *.html set ft=html

" -------- CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" -------- Javascript (Ecmascript)
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS


