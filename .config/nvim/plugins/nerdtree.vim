" Shortcut to open and close NerdTree with leader and b
nnoremap <Leader>b :NERDTreeToggle<CR>

" Close NERDTree when is close all files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" When open a file NERDTree is close
" let g:NERDTreeQuitOnOpen = 1

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

