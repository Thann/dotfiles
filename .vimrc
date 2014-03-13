execute pathogen#infect()

set t_Co=256

syntax enable
colorscheme elflord

set number

set mouse=a

" set spell
set spelllang=en_us

" Use smartcase
set ignorecase
set smartcase

" Highlight search results + incremental
set hlsearch
set incsearch

" Allow sudo-write
function SuWrite()
	if &readonly
		doautocmd BufWritePre
		w !sudo tee % > /dev/null
		if v:shell_error
			echo "Write Failed"
		else
			redraw!
			e!
		endif
	else
		w
	endif
endfunction
command W exec "let cpos=getpos('.')" | exec SuWrite() | call setpos('.', cpos)

" Default indent properties
"set ts=4 sts=4 sw=4 noet ai
set ts=2 sts=2 sw=2 et ai

" Detect indent size and type
autocmd BufReadPost * :DetectIndent
" Set local PWD to file location
"autocmd BufEnter * silent! lcd %:p:h
" Trim trailing whitespace on save
autocmd BufWritePre * exec "let cpos=getpos('.')" | :%s/\s\+$//e  | call setpos('.', cpos)

" Set folding options
set foldmethod=syntax
set foldlevel=20
map zz za

" Disable Ex mode
map Q <Nop>

" Customize NERDCommenter commands
filetype plugin on
nmap <C-e> <plug>NERDCommenterToggle
xmap <C-e> <plug>NERDCommenterToggle
imap <C-e> <ESC><plug>NERDCommenterToggle i
nmap <leader>c<space> <plug>NERDCommenterToggle
xmap <leader>c<space> <plug>NERDCommenterToggle

"Customize NERDTree commands
let NERDTreeQuitOnOpen=1
let g:nerdtree_tabs_open_on_new_tab=0
let g:nerdtree_tabs_open_on_gui_startup=0
nmap \e :NERDTreeSteppedOpen<CR>

" Tagbar shortcuts
command TT TagbarToggle
nmap tt :TagbarOpenAutoClose<CR>

" CtrlP
nmap \p :CtrlP<CR>
let g:ctrlp_switch_buffer='ET'
" open in tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Airline
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#left_alt_sep=' '
" Uncomment to use patched fonts
let g:airline_powerline_fonts=1

" Airline instantly escape visual mode
if ! has('gui_running')
  let g:airline#extensions#tabline#enabled=1 " dont show tabline in gvim
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Custom keybinds
map <S-Up> 1<C-u>
map <S-Down> 1<C-d>

" Disable F1 help
map <F1> <Esc>
imap <F1> <Esc>

" Custom command shortcuts
command C let @/ = ""
command S set spell!

