
"Config File For Vim8
"Waldomiro Seabra
"{{{Plugins
call plug#begin('~/.vim/plugged')
"{{{Side Windows Plugins
Plug 'scrooloose/nerdtree' "folder navigator
Plug 'majutsushi/tagbar' "side window with tags from the code
"}}}
"{{{SignColumn Plugins
Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
Plug 'dense-analysis/ale'
"}}}
"{{{Visual Plugins
Plug 'danielwe/base16-vim'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' "Lean & mean status/tabline for vim that's light as air.
Plug 'octol/vim-cpp-enhanced-highlight' "Additional Vim syntax highlighting for C++ (including C++11/14)
Plug 'leafgarland/typescript-vim'
" Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
"}}}
"{{{General Plugins
" Plug 'JuanSeabra/a.vim' "Alternate Files quickly (.c --> .h etc)
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes Prefix: gc
Plug 'tpope/vim-surround' "surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-repeat' "repeat.vim: enable repeating supported plugin maps with .
"Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs'
"}}}
"{{{Tags Plugins
" Plug 'ludovicchabant/vim-gutentags' "A Vim plugin that manages your tag files https://bolt80.com/gutentags/
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
"{{{Fuzzy Finder Plugin
" Plug 'ctrlpvim/ctrlp.vim' "Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"}}}
"{{{Completion Related Plugins
Plug 'SirVer/ultisnips' | Plug 'wseabra/vim-snippets' "UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
"Plug 'ryanolsonx/vim-lsp-javascript'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
"}}}
packadd termdebug
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
set shiftwidth=4 "size of identation
set tabstop=4 "size of tab
set expandtab "expand tab into spaces
set autoread "autoread buffer when edited outside of vim
set noshowmode "don't show default status line
set completeopt=menuone "type of completion window
set pumheight=15 "maximum size of completion window
set list lcs=tab:\┆\ ,eol:\¬,trail:\· "show indent lines when using tab, end of line and trail whitespaces
set showcmd "show command been typed
set wildmenu "activate wild bottom menu
set path+=** "set recursive search when using :find
set mouse=a
if !isdirectory("~/.vim/undodir")
    call system ("bash -c \"mkdir ~/.vim/undodir\"")
endif
set undodir=~/.vim/undodir "place of undo dir
set timeoutlen=1000 ttimeoutlen=0 "reduce delay in switching mode
set undofile "undo file
set t_Co=256  " Note: Neovim ignores t_Co and other terminal codes. (for vim)
set background=dark "set backgroud to dark
set termguicolors "use gui colors in terminal
set foldmethod=syntax "fold following the language syntax
set foldlevelstart=99 "prevent folding when oppenning file
autocmd BufEnter init.vim,.vimrc,vimrc,tmux.conf,.tmux.conf setlocal foldmethod=marker
autocmd BufRead init.vim,.vimrc,vimrc,tmux.conf,.tmux.conf :normal zM
set makeprg=cd\ \build_linux_x64\ &&\ make\ all
set hlsearch
set backspace=indent,eol,start
set incsearch

autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"}}}
"{{{Visual Configuration
"visual
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-irblack "theme
" hi Comment gui=italic cterm=italic

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
"{{{typescript-vim
let g:typescript_indent_disable = 1
"}}}
"{{{Airline
let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
"}}}
"{{{Ale
let g:ale_echo_msg_format = '[%linter% - %severity%] %s'
let g:ale_linters = {
            \ 'cpp': ['ccls'],
            \ 'c': ['cquery']
            \ }
let g:ale_set_highlights = 1
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
"}}}
"{{{Vim-lsp
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
let g:lsp_signs_enabled = 0         " enable signs
let g:lsp_diagnostics_echo_cursor = 0 " enable echo under cursor when in normal mode
" if executable('cquery')
"    au User lsp_setup call lsp#register_server({
"       \ 'name': 'cquery',
"       \ 'cmd': {server_info->['cquery']},
"       \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"       \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
"       \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"       \ })
"    autocmd FileType c setlocal omnifunc=lsp#complete
"    autocmd FileType cpp setlocal omnifunc=lsp#complete
"    autocmd FileType objc setlocal omnifunc=lsp#complete
"    autocmd FileType objcpp setlocal omnifunc=lsp#complete
" endif
" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
   autocmd FileType c setlocal omnifunc=lsp#complete
   autocmd FileType cpp setlocal omnifunc=lsp#complete
   autocmd FileType objc setlocal omnifunc=lsp#complete
   autocmd FileType objcpp setlocal omnifunc=lsp#complete
endif
" if executable('clangd')
"    augroup lsp_clangd
"        autocmd!
"        autocmd User lsp_setup call lsp#register_server({
"                    \ 'name': 'clangd',
"                    \ 'cmd': {server_info->['clangd', '-background-index']},
"                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"                    \ })
"        autocmd FileType c setlocal omnifunc=lsp#complete
"        autocmd FileType cpp setlocal omnifunc=lsp#complete
"        autocmd FileType objc setlocal omnifunc=lsp#complete
"        autocmd FileType objcpp setlocal omnifunc=lsp#complete
"    augroup end
" endif
"if executable('typescript-language-server')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'typescript-language-server',
"        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"        \ 'whitelist': ['typescript', 'javascript'],
"        \ })
"        autocmd FileType js setlocal omnifunc=lsp#complete
"        autocmd FileType ts setlocal omnifunc=lsp#complete
"endif
"if executable('pyls')
"    " pip install python-language-server
"    au User lsp_setup call lsp#register_server({
"                \ 'name': 'pyls',
"                \ 'cmd': {server_info->['pyls']},
"                \ 'whitelist': ['python'],
"                \ })
"endif
" if executable('lua-lsp')
"     au User lsp_setup call lsp#register_server({
"                 \ 'name': 'lua-lsp',
"                 \ 'cmd': {server_info->[&shell, &shellcmdflag, 'lua-lsp']},
"                 \ 'whitelist': ['lua'],
"                 \ })
" endif
"}}}
"{{{CtrlP
" let g:ctrlp_extensions = ['tag', 'buffertag']
" let g:ctrlp_match_window = 'bottom,order:btt,max:10'
" let g:ctrlp_map = '<leader>p'
"}}}
"{{{UltiSnips
"let g:UltiSnipsJumpForwardTrigger= "<c-j>"
"let g:UltiSnipsJumpBackwardTrigger= "<c-k>"
"let g:UltiSnipsRemoveSelectModeMappings = 0
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
nnoremap <leader>p <Esc> :find 
nnoremap <C-]> :ALEGoToDefinition<CR>
nnoremap <C-W><C-]> :ALEGoToDefinitionInVSplit<CR>
command! Q :q
command! W :w
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
"{{{F# Keymaps
noremap <F6> :setlocal spell! spelllang=pt,en<CR>
noremap <F7> :NERDTreeToggle<CR>
noremap <F8> :TagbarToggle<CR>
noremap <F2> :Make<CR>
" noremap <F3> :Dispatch cd $PWD/build_linux_x64/bin/Debug/ && ./AeroDiagnosticApp /host<CR>
" noremap <F4> :Dispatch cd $PWD/build_linux_x64/bin/Debug/ && ./ConsoleDiagnosticApp<CR>
" noremap <F12> :Dispatch g++ % -o %< -g -lm -O2 -std=c++11<CR>
"}}}
"{{{Buffer Movement
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>
map <leader>bd :bd<CR>
"}}}
"{{{Window Movement maps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"}}}
"{{{Move In Large Line As Multiple Lines
" noremap j gj
" noremap k gk
noremap <down> gj
noremap <up> gk
"}}}
"}}}
