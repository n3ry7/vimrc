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
Plug 'lervag/vimtex'
Plug 'sillybun/vim-repl'
call plug#end()
"end plugin manager
"
"Python stuff

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
let mapleader=" "

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


