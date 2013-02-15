syntax enable
colorscheme elflord

" set spell
set spelllang=en_us

" Use smartcase
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Allow sudo-write
function SuWrite()
	doautocmd BufWritePre
	w !sudo tee % > /dev/null
	if v:shell_error
		echo "Write Failed"
	else
		redraw!
		e!
	endif
endfunction
command W exec "let cpos=getpos('.')" | exec SuWrite() | call setpos('.', cpos)

" Default indent properties
set ts=4 sts=4 sw=4 noet ai

" Detect indent size and type
autocmd BufReadPost * :DetectIndent
" Trim trailing whitespace on save
autocmd BufWritePre * exec "let cpos=getpos('.')" | :%s/\s\+$//e  | call setpos('.', cpos)

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
command TT TagbarToggle
nmap tt :TagbarOpenAutoClose<CR>

" Custom keybinds
nnoremap <C-PageUp> :tabnext<CR>
nnoremap <C-PageDown> :tabprev<CR>
inoremap <C-PageUp> <Esc>:tabnext<CR>
inoremap <C-PageDown> <Esc>:tabprev<CR>
xnoremap <C-PageUp> <Esc>:tabnext<CR>
xnoremap <C-PageDown> <Esc>:tabprev<CR>

" Custom command shortcuts
command Q q!
command C let @/ = ""
command S set spell!

