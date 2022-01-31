" set leader key
let g:mapleader = "\<Space>"

"----General Settings----
syntax enable                           " Enables syntax highlighing
set hidden                              " Openning a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			        " Show the cursor position all the time
" set cmdheight=2                         " Number of screen lines to use for the command-line
" set iskeyword+=-                        " treat dash separated words as a word text object
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set termguicolors
" set conceallevel=0                      " So that I can see `` in markdown files
set number relativenumber               " Line numbers
set cursorline                          " Enable highlighting of the current line
" set background=dark                     " tell vim what the background color looks like

"----Tabs Settings----
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces

"----Indent settings----
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent

" -- Lines settings --
set laststatus=0                        " Always display the status line
" set showtabline=2                       " Always show tabs line
" set noshowmode                          " We don't need to see things like -- INSERT -- anymore

" Backups settings
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc

set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms

set formatoptions-=cro                  " stop newline continution of comments
" set clipboard=unnamedplus               " Copy paste between vim and everything else
" set autochdir                           " Your working directory will always be the same as your working directory

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %
