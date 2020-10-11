" Specify a directory for pluggins
call plug#begin('~/.config/nvim/plugged')

" NERDTree - Tree File Explorer
Plug 'scrooloose/nerdTree'

" Easy Motion - Text Navigation
Plug 'easymotion/vim-easymotion'

" Lens.vim - A Vim Automatic Window Resizing Plugin
Plug 'camspiers/lens.vim'

" vim-maximizer - Maximizes and restores the current window in Vim.
Plug 'szw/vim-maximizer'

"winresizer.vim - Very simple vim plugin for easy resizing of your vim windows
Plug 'simeji/winresizer'

" Initialize plugin system
call plug#end()

" Tab as spaces
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Disable backup
set nobackup
set nowritebackup

" Show line numbers
set number

" Enable mouse
set mouse+=a

" Window Moving
if bufwinnr(1)
    map <C-K> <C-W>k
    map <C-J> <C-W>j
    map <C-H> 5<C-W>h
    map <C-L> 5<C-W>l
endif

"-------------------- NERDTree --------------------
" Toggle NERDTree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Close neovim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"-------------------- Easy Motion --------------------
" Disable default mapping
let g:EasyMotion_do_mapping = 0

" Set the highlighting
hi link EasyMotionTarget ErrorMsg

map f <Plug>(easymotion-bd-w)
nmap f <Plug>(easymotion-overwin-w)

"-------------------- vim-maximizer --------------------
set winminheight=0
set winminwidth=0 
map <C-F> :MaximizerToggle<CR>
