syntax enable


" APPERANCE
set background=dark
colorscheme desert
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

" PATHOGEN
execute pathogen#infect()
syntax on
filetype plugin indent on

" PLUGINS
" nerdtree
autocmd vimenter * NERDTree " autoopen nerdtree
autocmd vimenter * if !argc() | NERDTree | endif " autoopen nerdtree without file selected
map <C-n> :NERDTreeToggle<CR> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
