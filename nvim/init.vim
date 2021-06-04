" Specify a directory for pluggins
call plug#begin('~/.config/nvim/plugged')

" nnn.vim
" File manager for vim/neovim powered by nnn
Plug 'mcchrish/nnn.vim'

" barbar.nvim
" A neovim tabline plugin.
Plug 'romgrk/barbar.nvim'

" Easy Motion - Text Navigation
Plug 'easymotion/vim-easymotion'

" Lens.vim - A Vim Automatic Window Resizing Plugin
Plug 'camspiers/lens.vim'

" vim-maximizer - Maximizes and restores the current window in Vim.
Plug 'szw/vim-maximizer'

"winresizer.vim - Very simple vim plugin for easy resizing of your vim windows
Plug 'simeji/winresizer'

" Auto Pairs - Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" vim-gitgutter - A Vim plugin which shows git diff markers in the sign column
Plug 'airblade/vim-gitgutter'

" fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" rigel color scheme
Plug 'Rigellute/rigel'

" javascript and react syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" nvim-toggleterm - A neovim lua plugin to help easily manage multiple terminal windows
Plug 'akinsho/nvim-toggleterm.lua'

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

" enable 24bit true color
set termguicolors

set hidden

" enable rigel theme
syntax enable
colorscheme rigel

" Once vim-javascript is installed you enable flow highlighting
let g:javascript_plugin_flow = 1

" Window Moving
if bufwinnr(1)
    map <C-K> <C-W>k
    map <C-J> <C-W>j
    map <C-H> 5<C-W>h
    map <C-L> 5<C-W>l
endif

" nnn.vim
let g:nnn#set_default_mappings = 0
let g:nnn#command = 'nnn -d'
nnoremap <silent> <C-b> :NnnPicker %:p:h<CR>
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

let g:nnn#action = {
    \ '<c-t>': 'tab split',
    \ '<c-x>': 'split',
    \ '<c-v>': 'vsplit' }

" barbar.nvim
let bufferline = get(g:, 'bufferline', {})
" let bufferline.auto_hide = v:true
let bufferline.closable = v:false
let bufferline.clickable = v:true
let bufferline.icons = 'numbers'

nnoremap <silent> <A-c> :BufferClose<CR>
nnoremap <silent> <C-s> :BufferPick<CR>
nnoremap <silent> <A-,> :BufferPrevious<CR>
nnoremap <silent> <A-.> :BufferNext<CR>
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
nnoremap <silent> <A->> :BufferMoveNext<CR>
nnoremap <silent> <A-1> :BufferGoto 1<CR>
nnoremap <silent> <A-2> :BufferGoto 2<CR>
nnoremap <silent> <A-3> :BufferGoto 3<CR>
nnoremap <silent> <A-4> :BufferGoto 4<CR>
nnoremap <silent> <A-5> :BufferGoto 5<CR>
nnoremap <silent> <A-6> :BufferGoto 6<CR>
nnoremap <silent> <A-7> :BufferGoto 7<CR>
nnoremap <silent> <A-8> :BufferGoto 8<CR>
nnoremap <silent> <A-9> :BufferLast<CR>

" nvim-toggleterm
lua << EOF
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell -- change the default shell
}
EOF


"-------------------- Easy Motion --------------------
" Disable default mapping
let g:EasyMotion_do_mapping = 0

" Set the highlighting
hi link EasyMotionTarget Text

map f <Plug>(easymotion-bd-w)
nmap f <Plug>(easymotion-overwin-w)

"-------------------- vim-maximizer --------------------
set winminheight=0
set winminwidth=0 
map <C-F> :MaximizerToggle<CR>

"-------------------- fzf.vim --------------------
map <Space> :Files<CR>
map <C-Space> :Buffers<CR>

" Disable autocomment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
