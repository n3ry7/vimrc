let $PATH = 'C:\Program Files (x86)\Git\bin;'.$PATH
"start a server (needed for vimtex)
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
"start plugin manager
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ap/vim-buftabline'
Plug 'dikiaap/minimalist'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'lervag/wiki.vim'
Plug 'ekiim/vim-mathpix'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sillybun/vim-repl'
Plug 'kassio/neoterm'
Plug 'goerz/jupytext.vim'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'MisanthropicBit/vim-numbers'
Plug 'justinmk/vim-sneak'
Plug 'mattn/calendar-vim'
Plug 'cespare/vim-toml'
Plug 'vim-python/python-syntax'
if has('nvim')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rlane/pounce.nvim'
endif

call plug#end()

if has('nvim')
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages

  -- Install languages synchronously (only applied to `ensure_installed`)

  -- List of parsers to ignore installing
  ignore_install = { "javascript"},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
endif



let g:repl_program = {
            \   'python': 'python -m IPython',
             \   'default': 'ipython',
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
nnoremap <F5> :REPLToggle<Cr>
" nnoremap <leader>h :REPLHide<Cr>
let g:repl_position = 3
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
tnoremap <C-n> <C-w>N
tnoremap <ScrollWheelUp> <C-w>Nk
tnoremap <ScrollWheelDown> <C-w>Nj
nnoremap <F12> :Tnew<Cr>apython -m IPython<Cr>
noremap <C-d> <C-e>
noremap <A-d> 2<C-e>
noremap <C-e> <C-y>
noremap <A-e> 2<C-y>
nnoremap <F9> :TREPLSendFile<Cr>
vnoremap <leader>W :TREPLSendSelection<Cr>
nnoremap <leader>W :TREPLSendLine<Cr>


au FileType python setl ofu=python3complete#Complete

"Jupytext
let g:jupytext_fmt = 'py'


"corrects tex empty file type
let g:tex_flavor = "latex"
autocmd FileType tex set textwidth=64 wrap
let g:vimtex_mappings_enabled= 1
let g:vimtex_toc_config ={
		\ 'show_help' : '0',
		\ 	 }
"let g:xwindow_id = system('xdotool getactivewindow')
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

" vim translator
" let g:translator_target_lang = 'en'
" let g:translator_source_lang = 'de'
" let g:translator_history_enable = 1
" let g:translator_enable_history  = 1
" nmap <silent> <Leader>t <Plug>Translate
" vmap <silent> <Leader>t <Plug>TranslateV
" nmap <silent> <localLeader>w <Plug>TranslateW
" vmap <silent> <localleader>w <Plug>TranslateWV
" " Replace the text with translation
" nmap <silent> <localLeader>tr <Plug>TranslateR

map <leader>so :source ~/.vimrc<CR>
map QQ :bd!<CR>
map Q <Esc>
map <leader>e :e! .vimrc<CR>
map <leader>n :NERDTree<CR>
nmap <space>e <Cmd>CocCommand explorer<CR>
map <leader>SC :setlocal spell! spelllang=en_us,pt<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
map <leader>+ yyp:s/\d\+/\=(submatch(0)+1)/g<CR>
map <localleader>fp :%s/\v[ ]*([^\.]*\.)/\1\r\r/g<cr>

nnoremap <leader>hl :set hlsearch!<CR>
nnoremap <leader>m :MinimapToggle<CR><C-w><c-w>

"Fuzzy finder
map <leader>b :ls<CR>:b
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'


" Vista
map <leader>vv :Vista!!<CR>
map <leader>vf :Vista finder<CR>
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }

"Splits move
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Buffers
nnoremap <silent> ² :bprevious!<CR>
nnoremap <silent> <PageUp> :bprevious!<CR>
nnoremap <silent> ¹ :bnext!<CR>
nnoremap <silent> ± :bnext!<CR>
nnoremap <silent> <PageDown> :bnext!<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"Auto close NERDtree after open file
let NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1
let NERDTreeHighlightCursorline=0
" autocmd FileType nerdtree setlocal relativenumber

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
autocmd FileType markdown set formatoptions+=w
autocmd FileType markdown set spell! spelllang=en_us,pt
autocmd FileType markdown set textwidth=69
autocmd BufNewFile ~/wiki/*.md norm "%pxxx^df\df\df\df\df\ I# 

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
" map <leader>z :FloatermNew bash /usr/bin/notetaker<CR>
" barbar tabtab
" Move to previous/next
hi BufTabLineFill ctermbg=gray  
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Goto buffer in position...
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)


function GoTo(jumpline)
  let values = split(a:jumpline, ":")
  execute "e ".values[0]
  call cursor(str2nr(values[1]), str2nr(values[2]))
  execute "normal zvzz"
endfunction

function GetLine(bufnr, lnum)
  let lines = getbufline(a:bufnr, a:lnum)
  if len(lines)>0
   return trim(lines[0])
  else
    return ''
  endif
endfunction

function! Jumps()
  " Get jumps with filename added
  let jumps = map(reverse(copy(getjumplist()[0])), 
    \ { key, val -> extend(val, {'name': getbufinfo(val.bufnr)[0].name }) })
 
  let jumptext = map(copy(jumps), { index, val -> 
      \ (val.name).':'.(val.lnum).':'.(val.col+1).': '.GetLine(val.bufnr, val.lnum) })

  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': jumptext,
        \ 'column': 1,
        \ 'options': ['--delimiter', ':', '--bind', 'alt-a:select-all,alt-d:deselect-all', '--preview-window', '+{2}-/2'],
        \ 'sink': function('GoTo')})))
endfunction

command! Jumps call Jumps()

function! Changes()
  let changes  = reverse(copy(getchangelist()[0]))

  let changetext = map(copy(changes), { index, val -> 
      \ expand('%').':'.(val.lnum).':'.(val.col+1).': '.GetLine(bufnr('%'), val.lnum) })

  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': changetext,
        \ 'column': 1,
        \ 'options': ['--delimiter', ':', '--bind', 'alt-a:select-all,alt-d:deselect-all', '--preview-window', '+{2}-/2'],
        \ 'sink': function('GoTo')})))
endfunction
command! -bang -bar -nargs=? -complete=dir FZFCd
	\ call fzf#run(fzf#wrap(
	\ {'source': 'find '..( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" ) ..
	\ ' -type d -maxdepth 1', 'sink': 'cd'}))

command! Changes call Changes()

nnoremap <leader>j :Jumps<cr>
nnoremap <leader>C :Changes<cr>

" Unlist terminal buffers
" if has('vim')
" autocmd TerminalOpen * if bufwinnr('') > 0 | setlocal nobuflisted | endif
" endif

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
set laststatus=0 ruler
set guifont=Hack\ Nerd\ Font:16:l
set backspace=indent,eol,start
" set guifont=Hack\ 16

"theme
set t_Co=256
colorscheme minimalist
hi BufTabLineFill ctermbg=gray  
set background=dark
set mouse=a
set number
set hlsearch
set incsearch
set winwidth=69
set modeline
set ignorecase
set smartcase
set omnifunc=syntaxcomplete#Complete
set timeoutlen=250
" Find files using Telescope command-line sugar.
if has('nvim')
nnoremap <leader>o <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>r <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>r <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>sc <cmd>lua require('telescope.builtin').spell_suggest()<cr>
nnoremap <leader>jl <cmd>lua require('telescope.builtin').jumplist()<cr>
else
nnoremap <leader>o :Files<cr>
nnoremap <leader>r :Buffers<cr>
nnoremap <leader>t :BTags<cr>
endif
nnoremap <leader>t :BTags<cr>
nnoremap <leader><Space> :Pounce<CR>
clearjumps
" let g:neovide_fullscreen=v:true
source ~/.cocconfig.vim
if has('nvim')
set guifont=Hack\ Nerd\ Font:16:l
endif

hi BufTabLineFill ctermbg=darkgray
