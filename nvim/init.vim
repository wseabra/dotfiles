"Config file for NeoVim
"Waldomiro Seabra

call plug#begin('~/.config/nvim/plugged')
Plug 'tomasr/molokai' "theme
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree' "folder navigator
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' "Lean & mean status/tabline for vim that's light as air.
Plug 'majutsushi/tagbar' "side window with tags from the code
Plug 'tpope/vim-fugitive'	"git integration
Plug 'scrooloose/nerdcommenter'	"commenter helper
Plug 'airblade/vim-gitgutter' "git diff integration
Plug 'ctrlpvim/ctrlp.vim'	"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'jiangmiao/auto-pairs' "Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'SirVer/ultisnips' "UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug 'honza/vim-snippets'	"This repository contains snippets files for various programming languages.
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'} | Plug 'Shougo/neoinclude.vim' | Plug 'zchee/deoplete-clang' "Dark powered asynchronous completion framework for neovim/Vim8
Plug 'neomake/neomake' "Asynchronous linting and make framework for Neovim/Vim
Plug 'octol/vim-cpp-enhanced-highlight' "Additional Vim syntax highlighting for C++ (including C++11/14)
call plug#end()

syntax on
filetype indent plugin on
set shell=/bin/zsh "shell
set cursorline "enable cursorline
set number "show line number
set colorcolumn=80 "color column 80
set shiftwidth=4 "size of identation
set tabstop=4 "size of tab
set expandtab "expand tab into spaces
set scrolloff=5 "scroll when x lines of bottom
set autoread "autoread buffer when edited outside of vim
set noshowmode "don't show default status line
set completeopt=menuone "type of completion window
set undodir=~/.config/nvim/undodir "place of undo dir
set undofile "undo file
set mouse=a "activate mouse
set background=dark
set termguicolors

colorscheme gruvbox

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

"cpp enhanced highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"NERDTree
let g:NERDTreeShowHidden=1

"TagBar
let g:tagbar_sort = 0

"airline
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0

let g:deoplete#sources#clang#libclang_path =  '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'

"neomake
call neomake#configure#automake('nrwi', 500)
"let g:neomake_open_list = 2

let g:neomake_cpp_enabled_makers = ['gcc', 'cpplint']

" Removes trailing spaces
"function! TrimWhiteSpace()
    "%s/\s\+$//e
"endfunction

"autocmd BufWritePre * :call TrimWhiteSpace()
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &
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
noremap <C-Space> :CtrlPBuffer<CR>
