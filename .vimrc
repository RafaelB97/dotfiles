"  ____        __            _   ____                       
" |  _ \ __ _ / _| __ _  ___| | | __ ) _ __ __ ___   _____  
" | |_) / _` | |_ / _` |/ _ \ | |  _ \| '__/ _` \ \ / / _ \ 
" |  _ < (_| |  _| (_| |  __/ | | |_) | | | (_| |\ V / (_) |
" |_| \_\__,_|_|  \__,_|\___|_| |____/|_|  \__,_| \_/ \___/ 
" 
" __     _____ __  __ 
" \ \   / /_ _|  \/  |
"  \ \ / / | || |\/| |
"   \ V /  | || |  | |
"    \_/  |___|_|  |_|
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set compativility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines 
" set modelines=0

" Automatically wrap text that extends beyond the screen length.
" set wrap

" set textwidth=79
" set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Display options
set showmode
set showcmd

" Show line numbers
" set number
set number relativenumber

" Status bar 
set laststatus=2

" Set status line display
" set statusline=
" set statusline+=\ %f

autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Vim lightline fix
if !has('gui_running')
  set t_Co=256
endif




" NERDTree settings
let NERDTreeQuitOnOpen=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>

nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

" Automatically closing braces
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ( ()<Esc>i

inoremap {} {}
inoremap [] []
inoremap () ()

" inoremap } <Esc>la
" inoremap ] <Esc>la
" inoremap ) <Esc>la

inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko

inoremap ' ''<Esc>i
inoremap " ""<Esc>i

