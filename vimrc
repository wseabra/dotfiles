
"Config File For Vim8
"        _              ___                     __ _
" __   _(_)_ __ ___    ( _ )    ___ ___  _ __  / _(_) __ _
" \ \ / / | '_ ` _ \   / _ \   / __/ _ \| '_ \| |_| |/ _` |
"  \ V /| | | | | | | | (_) | | (_| (_) | | | |  _| | (_| |
"   \_/ |_|_| |_| |_|  \___/   \___\___/|_| |_|_| |_|\__, |
"                                                    |___/
"Waldomiro Seabra
"{{{Plugins
call plug#begin('~/.vim/plugged')
"{{{Side Windows Plugins
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar' "side window with tags from the code
"}}}
"{{{SignColumn Plugins
Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
"}}}
"{{{Visual Plugins
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' "Lean & mean status/tabline for vim that's light as air.
Plug 'octol/vim-cpp-enhanced-highlight' "Additional Vim syntax highlighting for C++ (including C++11/14)
Plug 'ryanoasis/vim-devicons'
Plug 'mtdl9/vim-log-highlighting'
"}}}
"{{{General Plugins
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes Prefix: gc
Plug 'tpope/vim-surround' "surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-repeat' "repeat.vim: enable repeating supported plugin maps with .
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf.vim' "Search engine
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jesseleite/vim-agriculture' " Better ripgrep/Ag for FZF
Plug 'mhinz/vim-startify'
"}}}
"{{{Git Plugins
Plug 'tpope/vim-fugitive' "git integration
Plug 'airblade/vim-gitgutter' "git diff integration
"}}}
"{{{Text Objects Plugins
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire' "Text objects for entire buffer
Plug 'glts/vim-textobj-comment' "Vim text objects for comments
Plug 'kana/vim-textobj-line' "Text objects for the current line
Plug 'rhysd/vim-textobj-continuous-line' "line which continues onto multiple lines as text object
"}}}
"{{{Completion Related Plugins
Plug 'SirVer/ultisnips' | Plug 'wseabra/vim-snippets' " UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug 'jiangmiao/auto-pairs'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'prabirshrestha/vim-lsp'
"}}}
packadd termdebug
packadd cfilter
call plug#end()
"}}}
"{{{Set Commands
syntax on
filetype indent plugin on
set nocompatible
set shell=/bin/zsh "shell
set cursorline "enable cursorline
set colorcolumn=80 "color column 80
set number relativenumber "show line number and relative number
set scl=yes  " force the signcolumn to appear
set autoread "autoread buffer when edited outside of vim
set noshowmode "don't show default status line
set completeopt=menu,menuone,preview
set list lcs=tab:\ \ ,eol:\¬,trail:\· "show indent lines when using tab, end of line and trail white spaces
set showcmd "show command been typed
set wildmenu "activate wild bottom menu
set path+=** "set recursive search when using :find
set mouse=a
if has('nvim')
    set undodir=~/.config/nvim/undodir "place of undo dir
else
    set undodir=~/.vim/undodir
endif
set undofile "undo file
set timeoutlen=1000 ttimeoutlen=0 "reduce delay in switching mode
set foldmethod=syntax "fold following the language syntax
set foldlevelstart=99 "prevent folding when opening file
autocmd BufEnter init.vim,.vimrc,vimrc,tmux.conf,.tmux.conf setlocal foldmethod=marker
autocmd BufRead init.vim,.vimrc,vimrc,tmux.conf,.tmux.conf :normal zM
let &makeprg='scripts/mm.sh -p dev -u 0 -v '
set hlsearch incsearch "highlight search and incremental search"
set ignorecase
set backspace=indent,eol,start "sane backspace behaviour
set expandtab "expand tab into spaces
set shiftwidth=4 "size of indentation
set tabstop=4 "size of tab
set softtabstop=4
set efm+=%f:%l:%c:%m
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"}}}
"{{{Visual Configuration
" set t_Co=256  " Note: Neovim ignores t_Co and other terminal codes. (for vim)
set background=dark "set background to dark
set termguicolors "use gui colors in terminal
colorscheme molokai "theme
" let g:rehash256 = 1
" highlight Normal guibg=#00222B

if has('gui_running')
    amenu ToolBar.Open :NERDTreeToggle<CR>
    amenu ToolBar.RunCtags :TagbarToggle<CR>
    set lines=999 columns=999
    set guifont=Hack\ Regular\ 10
endif
"}}}
"{{{NERDTree
let g:NERDTreeWinSize = 50
let g:NERDTreeSortOrder=['\.pro','\.pri','\/$','[[extension]]']
"}}}
"{{{TagBar
let g:tagbar_sort = 0
"}}}
"{{{Airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"}}}
"{{{Cpp Enhanced Highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"}}}
"{{{FZF
let g:fzf_tags_command = 'ctags -R'
let g:fzf_preview_window = []
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-q': 'fill_quickfix'}
let g:fzf_command_prefix = 'Fzf'

" "}}}
"{{{vim-startify
let g:startify_bookmarks = ['~/Stone/repos/pos-mamba','~/.vimrc','~/.tmux.conf']
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
"}}}
"{{{GitGutter
let g:gitgutter_map_keys = 0
autocmd BufEnter * GitGutter
"}}}
"{{{Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"}}}
"{{{Vim-lsp
let g:lsp_diagnostics_enabled = 1         " disable diagnostics support
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
au BufWritePre *.c,*.cpp,*.cc,*.h,*.hpp LspDocumentFormatSync

" autocmd FileType cpp, c setlocal tagfunc=lsp#tagfunc
if executable('clangd-12')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd-12']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
autocmd FileType c setlocal omnifunc=lsp#complete
autocmd FileType cpp setlocal omnifunc=lsp#complete
autocmd FileType objc setlocal omnifunc=lsp#complete
autocmd FileType objcpp setlocal omnifunc=lsp#complete
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'whitelist': ['python'],
                \ })
    autocmd FileType python setlocal omnifunc=lsp#complete
endif

"}}}
"{{{Change Cursor Shape
if !has('gui_running')
    let &t_SI = "\<Esc>[5 q"
    let &t_SR = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[1 q"
endif
"}}}
let g:dispatch_no_maps = 1
" {{{Keymaps
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis
"{{{Miscellaneous
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
noremap <leader>a GVgg
noremap <leader>i <Esc>:LspDocumentFormatSync<CR>
nnoremap <Space>; A;<Esc>
nnoremap <Space>r <Esc> :LspReferences<CR>
nnoremap <Space>h <Esc> :LspHover<CR>
nnoremap <Space>] :LspDefinition<CR>
vmap <Space>y "+y
nmap <Space>p "+p
command! Q :q
command! Qa :qa
command! W :w
command! Wq :wq
command! Wqa :wqa
function! SwitchSourceHeader()
    if (expand ("%:e") == "cpp")
        find %:t:r.h
    else
        if (expand ("%:e") == "h")
            find %:t:r.cpp
        endif
    endif
endfunction
command! A call SwitchSourceHeader()
"}}}
"{{{FZF
nnoremap <Space>ff <Esc> :FzfFiles<CR>
nnoremap <Space>ft <Esc> :FzfBTags<CR>
nnoremap <Space>fg <Esc> :FzfTags<CR>
nnoremap <Space>fb <Esc> :FzfBuffers<CR>
nnoremap <Space>fc <Esc> :FzfCommands<CR>
nnoremap <Space>fp <Esc> :FzfGFiles<CR>
nnoremap <Space>fr <Esc> :FzfHistory<CR>
"}}}
"{{{QuickFix
nnoremap <Space>n :cn<CR>
nnoremap <Space>p :cp<CR>
"}}}
"{{{F# Keymaps
noremap <F2> :Make<CR>
noremap <F5> :set relativenumber!<CR>
noremap <F6> :setlocal spell! spelllang=pt,en<CR>
noremap <F7> :NERDTreeToggle<CR>
noremap <F8> :TagbarToggle<CR>
noremap <F4> :lvimgrep TODO %<CR> :lopen<CR>
"}}}
"{{{Buffer Movement
map <Space>bn :bn<CR>
map <Space>bp :bp<CR>
map <Space>bd :bd<CR>
"}}}
"{{{Window Movement maps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"}}}
"{{{Move In Large Line As Multiple Lines
noremap <down> gj
noremap <up> gk
"}}}
"}}}
