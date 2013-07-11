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
" cambio del color de statusbar al cambiar de modo
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
