syntax enable
colorscheme elflord

" set spell
set spelllang=en_us

" Allow sudo-write
command W w !sudo tee % > /dev/null

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
imap <C-e> <ESC><plug>NERDCommenterToggle i
nmap <leader>c<space> <plug>NERDCommenterToggle
xmap <leader>c<space> <plug>NERDCommenterToggle

" Tagbar shortcuts
cmap tt TagbarToggle
nmap tt :TagbarOpenAutoClose<CR>

