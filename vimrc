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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'dikiaap/minimalist'
Plug 'lervag/wiki.vim'
Plug 'ekiim/vim-mathpix'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sillybun/vim-repl'
Plug 'goerz/jupytext.vim'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'
Plug 'voldikss/vim-translator'
Plug 'voldikss/vim-floaterm'
Plug 'mattn/calendar-vim'
Plug 'cespare/vim-toml'

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
let g:AutoPairsShortcutJump = '<s-tab>'

"Jupytext
let g:jupytext_fmt = 'py'


"corrects tex empty file type
let g:tex_flavor = "latex"
autocmd FileType tex set textwidth=64 wrap
let g:vimtex_mappings_enabled= 1
let g:vimtex_toc_config ={
		\ 'show_help' : '0',
		\ 	 }
let g:xwindow_id = system('xdotool getactivewindow')
let g:vimtex_view_method = 'zathura'
map <leader>il = :Img2Latex<CR>
map <leader>it = :Img2Text<CR>


let g:vimtex_quickfix_ignore_filters = [
      \ 'Warnings',
      \]
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_mode = 0
let g:vimtex_quickfix_open_on_warning = 0
let mapleader = '\'	
map ç <leader>
let maplocalleader=" "

" vim translator
let g:translator_target_lang = 'en'
let g:translator_source_lang = 'de'
let g:translator_history_enable = 1
let g:translator_enable_history  = 1
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
nmap <silent> <localLeader>w <Plug>TranslateW
vmap <silent> <localleader>w <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <localLeader>tr <Plug>TranslateR
vmap <silent> <localLeader>tr <Plug>TranslateRV

map <leader>so :source ~/.vimrc<CR>
map QQ :q!<CR>
map <leader>e :e! .vimrc<CR>
map <leader>et :e! .tmux.conf<CR>
map <leader>n :NERDTree<CR>
map <leader>sc :setlocal spell! spelllang=en_us,pt<CR>
map <leader>+ yyp:s/\d\+/\=(submatch(0)+1)/g<CR>
map <localleader>fp :%s/\v[ ]*([^\.]*\.)/\1\r\r/g<cr>

noremap <Leader>y "+y
noremap <Leader>p "+p
nnoremap <leader>hl :set hlsearch!<CR>
nnoremap <leader>m :MinimapToggle<CR><C-w><c-w>

"Fuzzy finder
map <leader>f :Files<CR>
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
nnoremap <silent> ² :bprevious!<CR>
nnoremap <silent> ¹ :bnext!<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"Auto close NERDtree after open file
let NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1
let NERDTreeHighlightCursorline=0
autocmd FileType nerdtree setlocal relativenumber

"wiki
let g:wiki_root = '~/wiki'
let g:wiki_journal = {
                \ 'name': 'journal',
        \ 'frequency': 'daily',
        \ 'date_format': {
                \   'daily' : '%d-%m-%Y',
        \   'weekly' : '%V_%Y',
        \   'monthly' : 'm%_%Y',
        \ },
        \}
let g:wiki_journal.date_format.weekly = '%V_%Y'
let g:wiki_journal.date_format.monthly = '%V_%Y'
let g:wiki_export = {
	        \ 'args' : '',
        \ 'from_format' : 'markdown',
        \ 'ext' : 'pdf',
        \ 'link_ext_replace': v:false,
        \ 'view' : v:true,
        \ 'output': fnamemodify(tempname(), ':h'),
        \}
let g:wiki_write_on_nav = 1

let g:wiki_map_create_page = 'NamePage'

function NamePage(name) abort
	let l:name = wiki#get_root() . '/' . a:name
	" If the file is new, then append the current date
	return filereadable(l:name)
		\ ? a:name
		\ : a:name . '_' . strftime('%Y%m%d')
endfunction


let g:wiki_filetypes = ['md']

"markdown
autocmd FileType markdown map PP <plug>(wiki-export)
autocmd FileType markdown set formatoptions+=a
autocmd FileType markdown set spell! spelllang=en_us,pt
autocmd FileType markdown set textwidth=69
autocmd BufNewFile ~/wiki/*.md norm "%pxxx^df/df/df/ I#    

"vim-calendar
"let g:calendar_keys = { 'goto_next_month': '<C-Right>', 'goto_prev_month':
"'<C-Left>', 'goto_prev_year': '<C-Down>', 'goto_next_year': '<C-Up>'}
let g:calendar_keys = {'goto_next_month': '<C-Right>',       	'goto_prev_month': '<C-Left>',	'goto_prev_year': '<C-Down>',	'goto_next_year': '<C-Up>',	}
let g:calendar_diary = '~/wiki/journal'
"markdown
augroup Markdown
	autocmd!
	autocmd FileType markdown set wrap
augroup END

"markdown previwer
let g:md_pdf_viewer="okular"


"floaterm 
let g:floaterm_autoclose = 2
map <leader>z :FloatermNew bash /usr/bin/notetaker<CR>

"theme
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
set nocompatible
filetype on
syntax on
filetype indent plugin on
set guifont=Hack\ 16

source ~/.cocconfig.vim
