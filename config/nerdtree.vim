let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '.{1-2}$']

if has('mac')
    let NERDTreeDirArrows = 1
else
    let NERDTreeDirArrows = 0
endif
let NERDTreeMouseMode = 3
let NERDTreeShowHidden = 1

map <Leader>n :NERDTreeToggle<CR>

