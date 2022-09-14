
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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar' "side window with tags from the code
"}}}
"{{{SignColumn Plugins
Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
" Plug 'dense-analysis/ale'
"}}}
"{{{Visual Plugins
Plug 'lifepillar/vim-solarized8'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' "Lean & mean status/tabline for vim that's light as air.
Plug 'octol/vim-cpp-enhanced-highlight' "Additional Vim syntax highlighting for C++ (including C++11/14)
Plug 'ryanoasis/vim-devicons'
Plug 'mtdl9/vim-log-highlighting'
"}}}
"{{{General Plugins
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes Prefix: gc
Plug 'tpope/vim-surround' "surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-repeat' "repeat.vim: enable repeating supported plugin maps with .
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-dispatch'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
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
Plug 'prabirshrestha/async.vim'
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
set completeopt=menu,menuone,popup,preview
set list lcs=tab:\ \ ,eol:\¬,trail:\· "show indent lines when using tab, end of line and trail white spaces
set showcmd "show command been typed
set wildmenu "activate wild bottom menu
set path+=** "set recursive search when using :find
set mouse=a
set undodir=~/.vim/undodir "place of undo dir
set timeoutlen=1000 ttimeoutlen=0 "reduce delay in switching mode
set undofile "undo file
set foldmethod=syntax "fold following the language syntax
set foldlevelstart=99 "prevent folding when opening file
autocmd BufEnter init.vim,.vimrc,vimrc,tmux.conf,.tmux.conf setlocal foldmethod=marker
autocmd BufRead init.vim,.vimrc,vimrc,tmux.conf,.tmux.conf :normal zM
let &makeprg='scripts/mm.sh -p dev -u 0 -v '
set hlsearch incsearch "highlight search and incremental search"
set backspace=indent,eol,start "sane backspace behaviour

set expandtab "expand tab into spaces
set shiftwidth=4 "size of indentation
set tabstop=4 "size of tab
set softtabstop=4
set efm+=%f:%l:%c:%m

"}}}
"{{{Visual Configuration
" set t_Co=256  " Note: Neovim ignores t_Co and other terminal codes. (for vim)
set background=dark "set background to dark
set termguicolors "use gui colors in terminal
colorscheme solarized8_flat "theme
highlight Normal guibg=#00222B

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
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1
"}}}
"{{{Cpp Enhanced Highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"}}}
"{{{Leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_StlColorscheme = 'solarized'

let g:Lf_WildIgnore = {
            \ 'dir': ['.cache','.ccls-cache'],
            \ 'file': []
            \}
"}}}
"{{{vim-startify
let g:startify_bookmarks = ['~/Stone/repos/pos-mamba','~/.vimrc','~/.tmux.conf']
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
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
"{{{Grep and Find

function! Grep(...)
  let grep = 'grep --line-number '
  let cmd = grep . join(a:000, ' ')
  execute 'Dispatch ' . cmd
endfunction

command! -nargs=+ -complete=file_in_path Grep call Grep(<f-args>)

function! Find(...)
  let find = 'find '
  let pattern = a:1
  let path = '.'
  if len(a:000) > 1
    let path = a:2
  endif
  let iname = ' -iname "' . pattern . '" '
  let excludepath = ' ! -path "*.git*" ! -path "*node_modules*" '
  let type = ' -type f '
  let cmd = find . path . type . iname . excludepath
  execute 'Dispatch ' . cmd
endfunction


command! -nargs=+ -complete=file_in_path Find call Find(<f-args>)
"}}}
let g:dispatch_no_maps = 1
" {{{Keymaps
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis
"{{{Miscellaneous
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
noremap <leader>h <Esc> :LspHover<CR>
map <leader>n <Esc>:tabnew<CR>
noremap <leader>a GVgg
noremap <leader>i <Esc>:LspDocumentFormatSync<CR>
nnoremap <leader>; A;<Esc>
nnoremap <leader>p <Esc> :find
nnoremap <leader>ft <Esc> :LeaderfBufTag<CR>
nnoremap <leader>fg <Esc> :Leaderf gtags<CR>
nnoremap <leader>fb <Esc> :LeaderfBuffer<CR>
nnoremap <leader>fc <Esc> :LeaderfCommand<CR>
nnoremap <leader>r <Esc> :LspReferences<CR>
nnoremap <C-]> :LspDefinition<CR>
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
noremap <F2> :Make<CR>
noremap <F5> :set relativenumber!<CR>
noremap <F6> :setlocal spell! spelllang=pt,en<CR>
noremap <F7> :NERDTreeToggle<CR>
noremap <F8> :TagbarToggle<CR>
noremap <F4> :lvimgrep TODO %<CR> :lopen<CR>
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
noremap <down> gj
noremap <up> gk
"}}}
"}}}
