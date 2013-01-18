syntax enable
colorscheme elflord

" set spell
set spelllang=en_us

" default indent properties
set ts=4 sts=4 sw=4 noet ai

" detect indent size and type
autocmd BufReadPost * :DetectIndent
" trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

