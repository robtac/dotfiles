set exrc
set guicursor=
set relativenumber
set nu
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set nohlsearch
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

" Give more space for displaying messages
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

let mapleader = " "

if !exists('g:vscode')

call plug#begin('~/.vim/plugged')
" Telescope and requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Color theme
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'ThePrimeagen/harpoon'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'theprimeagen/vim-be-good'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-obsession'
" Write with sudo permissions
Plug 'lambdalisue/suda.vim'
call plug#end()

" NERDCommenter Settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" highlight Normal guibg=none
" set termguicolors
" let g:gruvbox_italic=1
" colorscheme gruvbox
colorscheme nord

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" Nerdtree
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nn :NERDTreeFind<CR>
nnoremap <leader>nc :NERDTreeCWD<CR>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Harpoon remaps
nmap <leader>tj :call GotoBuffer(0)<CR>
nmap <leader>tk :call GotoBuffer(1)<CR>
nmap <leader>tl :call GotoBuffer(2)<CR>
nmap <leader>t; :call GotoBuffer(3)<CR>

" Fugitive remaps (For git integration)
" nmap <leader>gl :diffget //3<CR>
" nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gs :G<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1
    \ && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

endif

vnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

au BufNewFile,BufRead Jenkinsfile setf groovy
