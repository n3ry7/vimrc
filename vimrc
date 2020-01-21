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
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-latex/vim-latex'
Plug 'ebranlard/vim-matlab-behave'
Plug 'yinflying/matlab-screen'
Plug 'nvie/vim-flake8'

call plug#end()
"end plugin manager
"
"Python stuff
autocmd FileType python nnoremap <buffer> <F12> :exec '!python' shellescape(@%, 1)<cr>

" Track the engine.


" Snippets are separated from the engine. Add this if you want them:


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-d>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"
let g:AutoPairsShortcutJump = '<S-tab>'
"List Snippets
let g:UltiSnipsListSnippets="<c-l>" 

"corrects tex empty file type
let g:tex_flavor = "latex" 
let mapleader=";"

map SO :so .vimrc<CR>
map QQ :q!<CR>
map W :w!<CR>
map E :e .vimrc<CR>
map N :NERDTree<CR>
map CC :! pdflatex %<CR><CR>
map PD :! mupdf $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>


"Auto close NERDtree after open file
let NERDTreeQuitOnOpen=1

set mouse=a
set number
set guifont=h24
