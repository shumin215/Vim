set number		" line number
set ai			" auto index
set si			" smart index
set cindent 		" c style index
set smartindent " Smart indent
set shiftwidth=4	" set shift is 4 blocks
set tabstop=4		" set tab key is 4 blocks
set ignorecase		" When searching both small letter and capital word
set hlsearch		" highlight when searching
set expandtab		" space instead of tab key
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
""set paste       " When pasting, eliminate indent, causes bad indent function
set visualbell  " Show bright


syntax on		" Turn on syntax highlight
sy enable       " Turn on syntax depend on file type
au BufNewFile,BufRead [mM]akefile,[mM]akefile*,GNUmakefile,*.mk,*.mak,*.dsp set noexpandtab
au BufNewFile,BufRead *.cu set ft=cuda  " For CUDA
au BufNewFile,BufRead *.cuh set ft=cuda " For CUDA
au BufNewFile,BufRead *.aap setf aap    " For Verilog
au BufNewFile,BufRead *.abc setf abc    " For Verilog
au BufNewFile,BufRead *.abl setf abel   " For Verilog
set nocompatible
filetype off
 
set rtp+=~/.vim/bundle/vundle/
 
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'git://git.wincent.com/command-t.git'
 
filetype plugin indent on

"================ 설치 Plugin ================
Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'AutoComplPop'
Plugin 'Syntastic'
Plugin 'minibufexpl.vim'
Plugin 'SuperTab'
Plugin 'AutoClose'

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

"============== minibufexpl 설정 ============
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

"=========== 키 맵핑 ============
map <F1> v]}zf					" 폴딩
map <F2> zo						" 폴딩 해제
map <F5> :Tlist<CR>				" Tlist
map <F4> :buffers<cr>
map <F7> :!mkcscope.sh<cr>		" cscpoe 재설정
map <F8> :cs reset<cr><cr>
map <F9> :!mksvscope.sh<cr>		" cscope for system verilog 재설정

"=========== 파일 버퍼간 이동 ============
map ,1 :b!1<CR>					" 1번 파일 버퍼로 이동
map ,2 :b!2<CR>					" 2번 파일 버퍼로 이동
map ,3 :b!3<CR>					" 3번 파일 버퍼로 이동
map ,4 :b!4<CR>					" 4번 파일 버퍼로 이동
map ,5 :b!5<CR>					" 5번 파일 버퍼로 이동
map ,6 :b!6<CR>					" 6번 파일 버퍼로 이동
map ,7 :b!7<CR>					" 7번 파일 버퍼로 이동
map ,8 :b!8<CR>					" 8번 파일 버퍼로 이동
map ,9 :b!9<CR>					" 9번 파일 버퍼로 이동
map ,0 :b!10<CR>				" 10번 파일 버퍼로 이동
map ,w :bw<CR>					" 현재 파일 버퍼를 닫음


"==== 현재 편집하는 함수 이름 표시 ====
"==== ctags.vim plugin ====
let generate_tags=1
map ,c :CTAGS<cr>

"==== 마지막 편집위치 기억 ====
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

"=========== ctag 설정 =============
set tags=./tags,tags;$HOME
",$RAMP_CROSS_DIR/tags
"set tags=./tags,/home/python477/Swarm_src/tags,/home/python477/RAMP_tools/tags,/home/python477/test/toolchain/sparc-ros-gcc/tags,/home/python477/Practise/Linux_Kernel/linux-3.1.2/tags
"/home/python477/Escal/Projects/FPGA_Sim/RAMP_Gold/ros-gcc-glibc/install-sparc-ros-gcc/tags, /home/python477/pintos/src/tags,


"===== 파일 저장시ctags tags 파일 자동업데이트 =====
function! UPDATE_TAGS()
	let _cmd_ = '"ctags -a -R "'
	let _resp = system(_cmd_)
	unlet _cmd_
	unlet _resp
endfunction
autocmd BufWrite *.cpp,*.h,*.c,*.sv,*.v call UPDATE_TAGS()

"=============== 자동 괄호닫기 (동작 안됨)===========
"let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"} 


"========= cscope 설정 =============
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
	cs add cscope.out
else
	cs add $RAMP_CROSS_DIR/cscope.out
	"cs add /home/python477/RAMP_tools/cscope.out
	"cs add /home/python477/Escal/Projects/FPGA_Sim/RAMP_Gold/ros-gcc-glibc/install-sparc-ros-gcc/cscope.out
	"cs add /home/python477/test/toolchain/sparc-ros-gcc/cscope.out
	"cs add /home/python477/Swarm_src/cscope.out
endif
set csverb

func! Css()
	let css = expand("<cword>")
	"new
	exe "cs find s ".css
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,css :call Css()<cr>

func! Csc()
	let csc = expand("<cword>")
	"new
	exe "cs find c ".csc
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csc :call Csc()<cr>

func! Csd()
	let csd = expand("<cword>")
	"new
	exe "cs find d ".csd
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csd :call Csd()<cr>

func! Csg()
	let csg = expand("<cword>")
	"new
	exe "cs find g ".csg
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csg :call Csg()<cr>

func! Cssn()
	let css = expand("<cword>")
	new
	exe "cs find s ".css
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,cssn :call Cssn()<cr>

func! Cscn()
	let csc = expand("<cword>")
	new
	exe "cs find c ".csc
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,cscn :call Cscn()<cr>

func! Csdn()
	let csd = expand("<cword>")
	new
	exe "cs find d ".csd
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csdn :call Csdn()<cr>

func! Csgn()
	let csg = expand("<cword>")
	new
	exe "cs find g ".csg
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csgn :call Csgn()<cr>

set laststatus=2
let g:ctags_statusline=1
