"Config file for NeoVim/Vim8
"Waldomiro Seabra

if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

Plug 'scrooloose/nerdtree' "folder navigator
Plug 'majutsushi/tagbar' "side window with tags from the code
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' "Lean & mean status/tabline for vim that's light as air.
Plug 'tpope/vim-fugitive'	"git integration
Plug 'scrooloose/nerdcommenter'	"commenter helper
Plug 'airblade/vim-gitgutter' "git diff integration
Plug 'ctrlpvim/ctrlp.vim'	"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'jiangmiao/auto-pairs' "Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'SirVer/ultisnips' "UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug 'JuanSeabra/vim-snippets'	"This repository contains snippets files for various programming languages.

if has('nvim')
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
    Plug 'Shougo/deoplete.nvim'
endif

Plug 'Shougo/neoinclude.vim' | Plug 'zchee/deoplete-clang' "Dark powered asynchronous completion framework for neovim/Vim8
Plug 'ervandew/supertab' "Perform all your vim insert mode completions with Tab
Plug 'neomake/neomake' "Asynchronous linting and make framework for Neovim/Vim
Plug 'octol/vim-cpp-enhanced-highlight' "Additional Vim syntax highlighting for C++ (including C++11/14)
Plug 'vim-scripts/a.vim' "Alternate Files quickly (.c --> .h etc)
Plug 'ludovicchabant/vim-gutentags' "A Vim plugin that manages your tag files https://bolt80.com/gutentags/
Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks

Plug 'itchyny/landscape.vim' "theme
if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

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

if has('nvim')
    set undodir=~/.config/nvim/undodir "place of undo dir
else
    if !isdirectory("~/.vim/undodir")
        call system ("bash -c \"mkdir ~/.vim/undodir\"")
    endif
    set undodir=~/.vim/undodir "place of undo dir
endif

set undofile "undo file
set background=dark "set backgroud to dark
set termguicolors "use gui colors in terminal
set foldmethod=syntax "fold following the language syntax
set foldlevelstart=20 "prevent folding when oppenning file

if !has('nvim')
    set t_Co=256  " Note: Neovim ignores t_Co and other terminal codes. (for vim)
endif

"visual
colorscheme landscape "theme
hi Normal guibg=NONE ctermbg=NONE
hi Comment gui=italic cterm=italic
hi SignColumn guibg=black ctermbg=0
hi LineNr guibg=black ctermbg=0
hi ColorColumn guibg=#121212 ctermbg=0
hi CursorLine guibg=#121212
hi CursorLineNr guibg=#121212

if has('gui_running')
    hi Normal guibg=black
    hi ColorColumn guibg=#121212
    set lines=999 columns=999
    set guifont=Hack\ Regular\ 9
endif


"NERDTree
let g:NERDTreeShowHidden=1
"close tab if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"TagBar
let g:tagbar_sort = 0

"cpp enhanced highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"airline
let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#sources#clang#libclang_path =  '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'

"neomake
call neomake#configure#automake('nrwi', 500)
let g:neomake_cpp_enabled_makers = ['clang', 'cpplint']
let g:neomake_c_enabled_makers = ['clang', 'cpplint']

"CtrlP
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_match_window = 'bottom,order:btt,max:10'

"SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

if has('nvim')
    ":terminal options
    au TermOpen * setlocal nonumber
    command! -nargs=* Term split | resize 20 | startinsert | terminal <args>
    command! -nargs=* Vterm vsplit | startinsert | terminal <args>
endif

"Shortcuts TODO fix this mess
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
map <F8> :TagbarToggle<CR>
noremap <F7> <Esc>:NERDTreeToggle<CR>
noremap <F5> :setlocal spell! spelllang=pt,en<cr>
map <C-n> <Esc>:tabnew<CR>
noremap <C-a> GVgg
noremap <C-I> <Esc>gg=G``
map bn :bn<CR>
map bp :bp<CR>
map bd :bd<CR>
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> <ESC>"+p
imap <C-v> <ESC>"+pa

if has('nvim')
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
    inoremap <A-h> <C-\><C-N><C-w>h
    inoremap <A-j> <C-\><C-N><C-w>j
    inoremap <A-k> <C-\><C-N><C-w>k
    inoremap <A-l> <C-\><C-N><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
else
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
endif

"move in large line as multiple lines
noremap j gj
noremap k gk
noremap <down> gj
noremap <up> gk
