" ----------------------------------------------------------------------------
"  Mapping
" ----------------------------------------------------------------------------

let mapleader = ","               " remap <LEADER> to ',' (instead of '\')
let g:mapleader = ","

nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" ---- Unimpaired
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" ----------------------------------------------------------------------------
"  Functions
" ----------------------------------------------------------------------------
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
