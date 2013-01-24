syntax enable
colorscheme elflord

" Set spell
set spelllang=en_us

" Default indent properties
set ts=4 sts=4 sw=4 noet ai

" Detect indent size and type
autocmd BufReadPost * :DetectIndent
" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Set folding options
set foldmethod=syntax
set foldlevel=20
map zz za

" Customize NERDCommenter commands
filetype plugin on
nmap <C-e> <plug>NERDCommenterToggle
xmap <C-e> <plug>NERDCommenterToggle
nmap <leader>c<space> <plug>NERDCommenterToggle
xmap <leader>c<space> <plug>NERDCommenterToggle

" Tagbar shortcuts
cmap tt TagbarToggle
nmap tt :TagbarOpenAutoClose<CR>

