set number		" line number
set ai			" auto index
set si			" smart index
set cindent 		" c style index
set shiftwidth=4	" set shift is 4 blocks
set tabstop=4		" set tab key is 4 blocks
set ignorecase		" When searching both small letter and capital word
set hlsearch		" highlight when searching
set expandtab		" space instead of tab key
set background=dark	" background color is dark
"color default
set nocompatible	" Can use cursor key
set fileencodings=utf-8,euc-kr	" set file encoding type
set bs=indent,eol,start	" It's possible to use backspace key
set history=1000	" contains history of 1000 commands
set ruler		" display coordinate of cursor at stateline
set nobackup		" Doesn't make backup file
set title		" Display title
set showmatch		" Display match of parenthesis
set nowrap		" Doesn't line change automatically
set wmnu		" tab 자동완성시 가능한 목록으 보여줌
set cursorline  " Make a cursorline
set paste       " When pasting, eliminate indent
set smartindent " Smart indent
set visualbell  " Show bright

syntax on		" Turn on syntax highlight
sy enable       " Turn on syntax depend on file type
au BufNewFile,BufRead [mM]akefile,[mM]akefile*,GNUmakefile,*.mk,*.mak,*.dsp set noexpandtab
au BufNewFile,BufRead *.cu set ft=cuda  " For CUDA
au BufNewFile,BufRead *.cuh set ft=cuda " For CUDA
au BufNewFile,BufRead *.aap setf aap    " For Verilog
au BufNewFile,BufRead *.abc setf abc    " For Verilog
au BufNewFile,BufRead *.abl setf abel   " For Verilog

execute pathogen#infect()
filetype plugin indent on

"autocmd vimenter * NERDTree    " NERDTree runs automatically
"autocmd vimenter * TagbarToggle
autocmd vimenter * if !argc() | NERDTree | endif
map <c-n> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * wincmd l
autocmd bufnew * wincmd l
map <c-m> :TagbarToggle<cr>

" 괄호 자동 완성 후 입력모드로 전환 "
"map! () ()<ESC>i
"map! (); ();<ESC>hi
"map! [] []<ESC>i
"map! {} {}<ESC>i
"map! {}; {};<BS><ESC>i<CR><ESC>O<BS>
"map! <> <><ESC>i
"map! " "<ESC>i
"map! "" ""<ESC>i
"=============== Commment Macro ============="
func! CmtOn()   "Comment On
    exe "'<,'>norm i//"
endfunc

func! CmtOff()  "Comment Off
    exe "'<,'>norm 2x"
endfunc

vmap <c-c> <esc>:call CmtOn() <cr>
vmap <c-x> <esc>:call CmtOff() <cr>
nmap <c-c> <esc>v:call CmtOn() <cr>
nmap <c-x> <esc>v:call CmtOff() <cr>

"===================Cscope===================="
"set csprg=/usr/bin/cscope
"set csto=0
"set cst
"set nocsverb

"if filereadable("./cscope.out")
"    cs add cscope.out
"else 
"    cs add /usr/src/linux/cscope.out
"endif
"set csverb
