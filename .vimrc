syntax enable


" APPERANCE
set background=dark
colorscheme solarized
set number 
set incsearch
" set ignorecase
set hlsearch " nohlsearch to disable 
" set smartcase
set laststatus=2 "status bar
hi StatusLine ctermbg=white ctermfg=red
au InsertEnter * hi StatusLine term=reverse ctermbg=black ctermfg=yellow 
au InsertLeave * hi StatusLine term=reverse ctermfg=red ctermbg=white
