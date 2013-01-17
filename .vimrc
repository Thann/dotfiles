syntax enable
colorscheme elflord

set ai

" set spell
set spelllang=en_us

" detect indent size and type
autocmd BufReadPost * :DetectIndent
" trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

