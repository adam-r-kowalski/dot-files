call plug#begin('~/.local/share/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'jpalardy/vim-slime'
Plug 'adam-r-kowalski/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'liuchengxu/vim-which-key'
Plug 'ziglang/zig.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-abolish'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
call plug#end()

syntax enable
set incsearch
filetype plugin indent on

set termguicolors

set shell=bash

set number
set relativenumber

colorscheme nord

set noswapfile

set noshowmode

set clipboard=unnamedplus

set mouse=a

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2


" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" set leader key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>N :NERDTreeFind<CR>
nmap <leader>d :Dispatch<CR>
nmap <leader>D :Focus
nmap <leader>f :GFiles<CR>
nmap <leader>b :Buffer<CR>
nmap <leader>g :Rg<CR>
nnoremap <localleader>b <C-O>
xmap <localleader>e <Plug>SlimeRegionSend
nmap <localleader>e <Plug>SlimeParagraphSend
nmap <localleader>E <Plug>SlimeConfig

let g:slime_target = "neovim"

nnoremap <M-s> :wa <cr>
vnoremap <M-s> :wa <cr>
inoremap <M-s> <C-o>:wa <cr>

let test#strategy = "neovim"
let test#python#runner = 'pytest'
let test#python#pytest#options = '-p no:warnings'

let g:lightline = {
	\ 'colorscheme': 'nord',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

let g:zig_fmt_autosave = 1
let test#custom_runners = {'zig': ['ZigTest']}
autocmd FileType zig let b:dispatch = 'zig build run'

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" enable transparancy
hi Normal guibg=NONE ctermbg=NONE

" terminal mode
tnoremap <ESC> <C-\><C-n>
tnoremap jk <C-\><C-n>

imap jk <Esc>
