syntax enable
colorscheme elflord

" set spell
set spelllang=en_us

" Allow sudo-write
function SuWrite()
	:doautocmd BufWritePre
	:w !sudo tee % > /dev/null
	:if v:shell_error
		echo "Write Failed"
	:else
		:redraw!
		:e!
	:endif
endfunction
command W exec SuWrite()

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

" Custom command shortcuts
command Q q!

