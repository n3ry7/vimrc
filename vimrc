if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"start plugin manager
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'sillybun/vim-repl'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
call plug#end()
"end plugin manager
"
"Python stuff
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   'vim': 'vim -e',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
let g:repl_position = 3
" Track the engine.


" Snippets are separated from the engine. Add this if you want them:


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-d>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"
let g:AutoPairsShortcutJump = '<c-e>'
"List Snippets


"corrects tex empty file type
let g:tex_flavor = "latex"
autocmd FileType tex set textwidth=72 wrap
let g:vimtex_mappings_enabled=1
let g:vimtex_quickfix_ignore_all_warnings = 0
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let mapleader=" "
let maplocalleader=" "

map <leader>so :source ~/.vimrc<CR>
map QQ :q!<CR>
map <leader>W :w!<CR>
map <leader>e :e! .vimrc<CR>
map N :NERDTree<CR>
noremap <Leader>y "+y
noremap <Leader>p "+p

"Auto close NERDtree after open file
let NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1

set mouse=a
set relativenumber
set guifont=h24


