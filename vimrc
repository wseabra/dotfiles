"Config File For Neovim/Vim8
"Waldomiro Seabra
"{{{Plugins
if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
"{{{Side Windows Plugins
Plug 'scrooloose/nerdtree' "folder navigator
Plug 'majutsushi/tagbar' "side window with tags from the code
"}}}
"{{{SignColumn Plugins
Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
Plug 'w0rp/ale'
"}}}
"{{{Visual Plugins
Plug 'ayu-theme/ayu-vim'
" Plug 'bluz71/vim-moonfly-colors'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' "Lean & mean status/tabline for vim that's light as air.
Plug 'octol/vim-cpp-enhanced-highlight' "Additional Vim syntax highlighting for C++ (including C++11/14)
Plug 'edkolev/tmuxline.vim'
"}}}
"{{{General Plugins
Plug 'JuanSeabra/a.vim' "Alternate Files quickly (.c --> .h etc)
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes Prefix: gc
" Plug 'christoomey/vim-titlecase' "Teach Vim about titlecase, with support for motions and text objects
Plug 'tpope/vim-surround' "surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-repeat' "repeat.vim: enable repeating supported plugin maps with .
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-dispatch'
"}}}
"{{{Tags Plugins
Plug 'ludovicchabant/vim-gutentags' "A Vim plugin that manages your tag files https://bolt80.com/gutentags/
"}}}
"{{{Git Plugins
Plug 'tpope/vim-fugitive'	"git integration
Plug 'airblade/vim-gitgutter' "git diff integration
"}}}
"{{{Text Objects Plugins
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire' "Text objects for entire buffer
Plug 'glts/vim-textobj-comment' "Vim text objects for comments
Plug 'kana/vim-textobj-line' "Text objects for the current line
Plug 'rhysd/vim-textobj-continuous-line' "line which continues onto multiple lines as text object
" Plug 'kana/vim-textobj-indent'
"}}}
"{{{Fuzzy Finder Plugin
Plug 'ctrlpvim/ctrlp.vim'	"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"}}}
"{{{Completion Related Plugins
Plug 'ervandew/supertab' "Perform all your vim insert mode completions with Tab
Plug 'SirVer/ultisnips' | Plug 'JuanSeabra/vim-snippets' "UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/neoinclude.vim' | Plug 'zchee/deoplete-clang' "Dark powered asynchronous completion framework for neovim/Vim8
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
"}}}
packadd termdebug
call plug#end()
"}}}
"{{{Set Commands
syntax on
filetype indent plugin on
set shell=/bin/zsh "shell
set cursorline "enable cursorline
set colorcolumn=80 "color column 80
set number relativenumber "show line number and relative number
set shiftwidth=4 "size of identation
set tabstop=4 "size of tab
set expandtab "expand tab into spaces
set autoread "autoread buffer when edited outside of vim
set noshowmode "don't show default status line
set completeopt=noinsert,menuone,noselect "type of completion window
set pumheight=15 "maximum size of completion window
set list lcs=tab:\┆\  "show indent lines when using tab
set showcmd "show command been typed
set wildmenu "activate wild bottom menu
set path+=** "set recursive search when using :find
set mouse=a
if has('nvim')
    set undodir=~/.config/nvim/undodir "place of undo dir
else
    if !isdirectory("~/.vim/undodir")
        call system ("bash -c \"mkdir ~/.vim/undodir\"")
    endif
    set undodir=~/.vim/undodir "place of undo dir
    set timeoutlen=1000 ttimeoutlen=0 "reduce delay in switching mode
endif
set undofile "undo file
set t_Co=256  " Note: Neovim ignores t_Co and other terminal codes. (for vim)
set background=dark "set backgroud to dark
set termguicolors "use gui colors in terminal
set shortmess+=c " suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set foldmethod=syntax "fold following the language syntax
set foldlevelstart=99 "prevent folding when oppenning file
autocmd BufEnter .vimrc,vimrc,tmux.conf,.tmux.conf setlocal foldmethod=marker
autocmd BufRead .vimrc,vimrc,tmux.conf,.tmux.conf :normal zM
set makeprg=cd\ $HOME/doctor_strange/src/\ &&\ ./build_all.sh\ $HOME/Qt/5.11.1/gcc_64
set hlsearch
"}}}
"{{{Visual Configuration
"visual
" let g:moonflyCursorColor = 1
" let g:moonflyUnderlineMatchParen = 1
let ayucolor="dark"
colorscheme ayu "theme
hi Normal guibg=black ctermbg=0
hi Comment gui=italic cterm=italic
" hi SignColumn guibg=black ctermbg=0
" hi LineNr guibg=black ctermbg=0
" hi ColorColumn guibg=#121212 ctermbg=0
" hi CursorLine guibg=#121212
" hi CursorLineNr guibg=#121212

if has('gui_running')
    hi ColorColumn guibg=#121212
    set lines=999 columns=999
    set guifont=Hack\ Regular\ 10
endif
"}}}
"{{{GitGutter
let g:gitgutter_map_keys = 0
autocmd BufEnter * GitGutter
"}}}
"{{{Indentline
let g:indentLine_char = '┆'
let g:indentLine_setColors = 0
"}}}
"{{{NERDTree
let g:NERDTreeShowHidden=1
"close tab if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}
"{{{TagBar
let g:tagbar_sort = 0
"}}}
"{{{Cpp Enhanced Highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"}}}
"{{{Airline
let g:airline_theme='simple'
" let g:airline_theme = 'moonfly'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
"}}}
"{{{Ale
let g:ale_echo_msg_format = '[%linter% - %severity%] %s'
let g:ale_linters = {
            \ 'cpp': ['cpplint'],
            \ 'c': ['cpplint']
            \ }
"}}}
"{{{Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
if ! empty(glob("/usr/lib/libclang.so"))
    let g:deoplete#sources#clang#libclang_path =  '/usr/lib/libclang.so'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'
else
    let g:deoplete#sources#clang#libclang_path =  '/usr/lib/llvm-3.8/lib/libclang.so.1'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'
endif
"}}}
"{{{CtrlP
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_match_window = 'bottom,order:btt,max:10'
let g:ctrlp_map = '<leader>p'
"}}}
"{{{SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"
"}}}
"{{{UltiSnips
"Prevent conflit with SuperTab <tab>
let g:UltiSnipsJumpForwardTrigger= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
"}}}
"{{{:terminal Options
if has('nvim')
    au TermOpen * setlocal nonumber norelativenumber
    command! -nargs=* Term split | resize 20 | startinsert | terminal <args>
    command! -nargs=* Vterm vsplit | startinsert | terminal <args>
endif
"}}}
"{{{Change Cursor Shape
if !has('gui_running')
    let &t_SI = "\<Esc>[5 q"
    let &t_SR = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[1 q"
endif
"}}}
"{{{Keymaps
"{{{Miscellaneous
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
map <leader>n <Esc>:tabnew<CR>
noremap <leader>a GVgg
noremap <leader>i <Esc>gg=G``
nnoremap <leader>; A;<Esc>
command! Q :q
"}}}
"{{{F# Keymaps
noremap <F5>  :setlocal spell! spelllang=pt,en<CR>
noremap <F8>  :TagbarToggle<CR>
noremap <F7>  :NERDTreeToggle<CR>
noremap <F9>  :Make<CR>
noremap <F10> :Dispatch cd $HOME/doctor_strange/src/bin/ && ./DoctorStrangeCli<CR>
noremap <F12> :Dispatch g++ % -o %< -g -lm -O2 -std=c++11<CR>
"}}}
"{{{Buffer Movement
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>
map <leader>bd :bd<CR>
"}}}
"{{{Window Movement maps
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
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
endif
"}}}
"{{{Move In Large Line As Multiple Lines
noremap j gj
noremap k gk
noremap <down> gj
noremap <up> gk
"}}}
"}}}
