set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype indent on
filetype plugin on

" -------- Chargement des fichiers de config -------- "
runtime! config/*.vimrc
runtime! config/**/*.vimrc
