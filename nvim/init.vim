"Config file for Vim
"Waldomiro Seabra

call plug#begin('~/.config/nvim/plugged')
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'	"folder navigator
"Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' "Lean & mean status/tabline for vim that's light as air.
Plug 'majutsushi/tagbar'		"side window with tags from the code
Plug 'tpope/vim-fugitive'		"git integration
Plug 'scrooloose/nerdcommenter'	"commenter helper
Plug 'airblade/vim-gitgutter' "git diff integration
Plug 'ctrlpvim/ctrlp.vim'		"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'jiangmiao/auto-pairs'		"Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'SirVer/ultisnips'		"UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug 'honza/vim-snippets'	"This repository contains snippets files for various programming languages.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }| Plug 'Shougo/neoinclude.vim' | Plug 'zchee/deoplete-clang' | Plug 'zchee/deoplete-jedi' | Plug 'wokalski/autocomplete-flow' "Dark powered asynchronous completion framework for neovim/Vim8
Plug 'neomake/neomake' "Asynchronous linting and make framework for Neovim/Vim
call plug#end()

syntax on
filetype indent plugin on
set nocompatible
set shell=/bin/zsh
set cursorline
set number
set shiftwidth=2
set tabstop=2
set softtabstop=2
set scrolloff=5
set autoread
set noshowmode
set completeopt=menu
set undodir=~/.vim/undodir
set undofile
set mouse=a
set guifont=Inconsolata\ 12

colorscheme molokai

"NERDTree
let g:NERDTreeShowHidden=1

"airline
"let g:airline_theme='molokai'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tmuxline#enabled = 0

"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:deoplete#sources#clang#libclang_path =  '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

let g:neosnippet#enable_completed_snippet = 1

"neomake
call neomake#configure#automake('nrwi', 500)
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']

" Removes trailing spaces
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()

"Shortcuts
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
noremap <F6> :set spell spelllang=<cr>
noremap <F5> :set spell spelllang=pt,en<cr>
map <F8> :TagbarToggle<CR>
map <F9> :Neomake!<CR>:copen<CR>
noremap <F7> <Esc>:NERDTreeToggle<CR>
map <C-n> <Esc>:tabnew<CR>
noremap <C-a> GVgg
noremap <C-I> <Esc>gg=G``
map cn :cn<CR>
map cp :cp<CR>
map bn :bn<CR>
map bp :bp<CR>
map bd :bd<CR>
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> <ESC>"+p
imap <C-v> <ESC>"+pa
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap q: <Nop>
nnoremap Q <Nop>
"move in large line as multiple lines
noremap j gj
noremap k gk
noremap <down> gj
noremap <up> gk
