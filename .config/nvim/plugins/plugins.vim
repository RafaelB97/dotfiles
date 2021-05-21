call plug#begin('~/.config/nvim/autoload/plugged')
    " Pluggins
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Rainbow Parentheses
    Plug 'junegunn/rainbow_parentheses.vim'
    " Startify
    Plug 'mhinz/vim-startify'

    " Themes
    " One Dark Theme
    Plug 'joshdick/onedark.vim'
    " Dracula Theme
    Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()
