set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set exrc
" set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set encoding=UTF-8
set fileencoding=UTF-8

" For yank. unnamedplus for linux and unnamed for OSX
set clipboard=unnamedplus

" Always show the status line at bottom, even if only one window open
set laststatus=2

" Makes searching more convenient
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
" set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=auto

" Enable code folding/unfolding (use za)
set foldmethod=indent
set foldlevel=99

" Color 81th column only
" set colorcolumn=81

" Color everything after 80 lines
" let &colorcolumn=join(range(81,999),",")

highlight ColorColumn ctermbg=235 guibg=#1c1c1c

" Give more space for displaying messages
" set cmdheight=2

" Having longer updatetime (default is 4000ms = 4s) leads to noticeable delays
" and poor user experience.
" set updatetime=50

" Don't pass messages to |ins-completion-menu|
" set shortness+=c


" Automate vim-plug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" colorscheme
Plug 'gruvbox-community/gruvbox'

" git
Plug 'tpope/vim-fugitive'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" comments
Plug 'scrooloose/nerdcommenter'

" code completion
Plug 'valloric/youcompleteme'

" file explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'PhilRunninger/nerdtree-buffer-ops'

" nvim file explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" surround
Plug 'tpope/vim-surround'

" taglist
Plug 'yegappan/taglist'

" html
Plug 'mattn/emmet-vim'

call plug#end()

colorscheme gruvbox

" Remaps and leaders
" ------------------
" Format of remap: mode lhs rhs
" re = recursive execution
let mapleader = " "
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")"})<CR>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Autocommands
" ------------
"
" Function to trim whitespace when saved
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Group autocommands together and detach and attach everytime
augroup codeek
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Django recommended settings for YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
