syntax enable


" APPERANCE
set background=dark
set number 
set laststatus=2 "status bar
hi StatusLine ctermbg=white ctermfg=red
au InsertEnter * hi StatusLine term=reverse ctermbg=black ctermfg=yellow 
au InsertLeave * hi StatusLine term=reverse ctermfg=red ctermbg=white

" KEYMAP
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" SEARCH
set incsearch
" set ignorecase
set hlsearch " nohlsearch to disable 
" set smartcase


" curso 
set nocompatible " movidas entre vi y vim, obligatorio ?
set foldmethod " ?
