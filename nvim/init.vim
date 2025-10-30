" Set PYTHONPATH to include your Python and Jedi paths
set shell=/usr/bin/zsh
set shellcmdflag=-ic
let $PYTHONPATH='/home/nery/.pyenv/shims'

lua require'lazy_config'
lua require'lspconfig_config'
lua require'iron_nvim_config'
lua require'cmp_config'
lua require'treesitter_config'
lua require'telescope_config'
lua require'markdown_config'
lua require'nvim_tree_config'

lua require'misc'
"lua require'create_file_and_open_snippet'

set completeopt=menu,menuone,noselect
set diffopt=vertical

let g:wiki_root = '~/wiki'
let g:wiki_filetypes = ['md', 'wiki']

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

command! CdHome cd ~

let qapleader = '\'

vnoremap G G$
nnoremap G G$
vnoremap gg gg0
nnoremap gg gg0

nnoremap <silent> <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>rn :lua vim.lsp.buf.rename()<CR>

noremap <leader>ed :exe 'edit '.stdpath('config').'/init.vim'<cr>:cd %:h<cr>
nnoremap <leader>o <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>j <cmd>lua require('telescope.builtin').jumplist()<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>gr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>r <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>e <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>d <cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<cr>
nnoremap <leader>m <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>q <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

inoremap <C-x><C-o> <Cmd>lua require('cmp').complete()<CR>

nnoremap <silent> rn :lua vim.lsp.buf.rename()<CR>

nnoremap <Space> <Plug>Sneak_s
nnoremap <Space><BS> <Plug>Sneak_S
nnoremap <Space><Space> :Pounce<CR>

nnoremap <leader>so :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>e :Oil<CR>
nnoremap '' :bd<CR>

"nnoremap <leader>g :Telekasten new_templated_note<CR>
nnoremap <leader>g :Telekasten new_templated_note<CR>g<C-R>=strftime("%d-%m")<CR><CR>tg
"jump to edits in note template
autocmd FileType markdown nnoremap ]] /^##\s\+\w\+\n\zs.*$<CR>A
autocmd FileType markdown nnoremap [[ ?^##\s\+\w\+\n\zs.*$<CR>A

map <leader>sc :setlocal spell! spelllang=en_us,pt<CR>
noremap QQ :bd!<CR>

set guifont=Noto_Sans_Regular:h17


" . Goto buffer in position...
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

"theme
set t_Co=256
syntax on
colorscheme minimalist
" colorscheme material
let g:material_style = "darker"
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

hi! @type.python guifg=#d7af00
hi! @variable.member.python guifg=#5f5faf
" hi! @variable.parameter.python guifg=#d7875f

let g:loaded_netrwPlugin = 1
let g:loaded_netrw = 1


function! FzfChangeDirectory()
  let l:dir = fzf#run(fzf#wrap({
        \ 'source': 'fd --type d --hidden --exclude .git .',
        \ 'sink': 'cd',
        \ 'options': '--preview "ls -lA --group-directories-first {} | head -10"',
        \ 'down': '40%'
        \ }))
endfunction

command! CD call FzfChangeDirectory()
nnoremap <leader>cd :CD<CR>

command! PasteXclipImageToWiki let g:img_count = len(split(globpath(expand('%:p:h') . '/img/', 'img*.png'), '\n')) | let g:img_filename = printf('img%d.png', g:img_count + 1) | silent! execute '!xclip -selection clipboard -t image/png -o > ' . expand('%:p:h') . '/img/' . g:img_filename | execute 'normal! i![](/img/' . g:img_filename . ')<Esc>'
nnoremap <leader>p :PasteXclipImageToWiki<CR>
