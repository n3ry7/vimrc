"automaticaly install plug vim if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"start a server (needed for vimtex)
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

"start plugin manager
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'dikiaap/minimalist'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'wfxr/minimap.vim'
Plug 'ekiim/vim-mathpix'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sillybun/vim-repl'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'
call plug#end()


" Python stuff REPL
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
let g:repl_output_copy_to_register = "t"
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>h :REPLHide<Cr>
let g:repl_position = 3
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
tnoremap <C-n> <C-w>N
tnoremap <ScrollWheelUp> <C-w>Nk
tnoremap <ScrollWheelDown> <C-w>Nj


au FileType python setl ofu=python3complete#Complete

"Vimux
"map <Leader>vz :call VimuxZoomRunner()<CR>
" map <Leader>vx :VimuxInterruptRunner<CR>
"map <Leader>r :VimuxPromptCommand<CR>ipython<CR>:SlimuxREPLConfigure<CR>
"let g:VimuxOrientation = "h"
"let g:VimuxHeight = "34"
""Slimux
"map  <Leader>w :SlimuxREPLSendLine<CR>:<C-u>call search('^.\+')<CR>
"vmap <Leader>w :SlimuxREPLSendSelection<CR>
"vmap <Leader>rc :SlimuxREPLConfigure<CR>
"map  <f5> :SlimuxREPLSendBuffer<CR>

" Super tab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1
let g:SuperTabClosePreviewOnPopupClose = 1
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-Right>"
let g:UltiSnipsJumpBackwardTrigger="<c-Left>"
let g:AutoPairsShortcutJump = '<s-esc>'
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"List Snippets


"corrects tex empty file type
let g:tex_flavor = "latex"
autocmd FileType tex set textwidth=64 wrap
let g:vimtex_mappings_enabled= 1
let g:vimtex_toc_hide_help = 1
" let g:vimtex_view_general_viewer = 'okular'
let g:xwindow_id = system('xdotool getactivewindow')
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_zathura_hook_view = 'MyHook'
let g:vimtex_view_zathura_hook_callback = 'MyHook'

function! MyHook()
  silent call system('xdotool windowactivate ' . g:xwindow_id . ' --sync')
endfunction

let g:vimtex_quickfix_ignore_filters = [
      \ 'Warnings',
      \]
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_mode = 0
let g:vimtex_quickfix_open_on_warning = 0
let mapleader = '\'	
map ç \
nmap <tab> \
let maplocalleader=" "

map <leader>so :source ~/.vimrc<CR>
map QQ :q!<CR>
map <leader>e :e! .vimrc<CR>
map <leader>et :e! .tmux.conf<CR>
map <leader>n :NERDTree<CR>
map <leader>sc :setlocal spell! spelllang=en_us,pt<CR>
map <leader>+ yyp:s/\d\+/\=(submatch(0)+1)/g<CR>

noremap <Leader>y "+y
noremap <Leader>p "+p
nnoremap <leader>hl :set hlsearch!<CR>
nnoremap <leader>m :MinimapToggle<CR><C-w><c-w>

"Fuzzy finder
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
"Splits move
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <leader>o :FZF<CR>
nnoremap <silent> ² :bprevious<CR>
nnoremap <silent> ¹ :bnext<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"Auto close NERDtree after open file
let NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1
let NERDTreeHighlightCursorline=0
autocmd FileType nerdtree setlocal relativenumber

set t_Co=256
colorscheme minimalist
set background=dark
set mouse=a
set relativenumber
set guifont=h24
set hlsearch
set incsearch
set winwidth=68
set modeline
set ignorecase
set smartcase
set omnifunc=syntaxcomplete#Complete

"Auto save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Unlist terminal buffers
autocmd TerminalOpen * if bufwinnr('') > 0 | setlocal nobuflisted | endif

"Open help and docs on vertical right
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END

let python_highlight_all=1
filetype on
syntax on
filetype indent plugin on
set guifont=Hack\ 16

