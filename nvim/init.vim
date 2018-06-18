"Configuration file for neovim
"author: Waldomiro Juan Gadelha Seabra
"wjgs@icomp.ufam.edu.br
source $HOME/.config/nvim/plugins.vim
syntax on             " Enable syntax highlighting
filetype indent plugin on    " Enable filetype-specific indenting and plugins
set nocompatible      " We're running Vim, not Vi!
set shell=/bin/zsh
set t_Co=256
set termguicolors
set cursorline
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set laststatus=2
set scrolloff=5         "Start scrolling when we're 5 lines away from margins
set sidescrolloff=15
set sidescroll=1
set autoread
set noshowmode
set completeopt=menu
set list
set background=dark
set undodir=~/.config/nvim/undodir
set undofile
set mouse=a
"set spell spelllang=pt,en

"NERDTree
let g:NERDTreeShowHidden=1


"airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0

"vimtex
"let g:vimtex_view_general_viewer = 'evince'
"let g:vimtex_view_general_viewer = 'qpdfview'
"let g:vimtex_view_general_options
			"\ = '--unique @pdf\#src:@tex:@line:@col'
"let g:vimtex_view_general_options_latexmk = '--unique'


  if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.tex = '\\(?:'
        \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
        \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
        \ .')'

"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path =  '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"Neomake

autocmd! BufWritePost * Neomake

let g:neomake_open_list = 2

let g:neomake_cpp_gcc_maker = {
			\ 'args': ['-Wno-unused-variable -Wunused-parameter'],
			\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
			\ }
let g:neomake_cpp_enabled_makers = ['gcc']

let g:neomake_c_gcc_maker = {
			\ 'args': ['-Wno-unused-variable -Wunused-parameter'],
			\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
			\ }
let g:neomake_c_enabled_makers = ['gcc']

let g:neomake_matlab_mlint_maker = {
			\ 'exe': '/home/waldomiro/R2016b/bin/glnxa64/mlint',
			\ 'errorformat': 'L %l \(C %c\): %m,L %l (C %c-%*[0-9]): %m',
			\ }
let g:neomake_matlab_enabled_makers = ['mlint']


"javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

autocmd FileType cs setlocal omnifunc=omnisharp#Complete

"reload init.vim after save
autocmd BufWritePost init.vim source ~/.config/nvim/init.vim

if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" THEME
colorscheme onedark
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
"hi Normal guibg=NONE ctermbg=NONE

if has('nvim')
	nmap <BS> <C-W>h
endif

" Removes trailing spaces
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction

autocmd BufWritePre     * :call TrimWhiteSpace()

autocmd! BufWritePost * wshada!
autocmd FileType tex set spell spelllang=pt,en
autocmd FileType txt set spell spelllang=pt,en

"Shortcuts
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
noremap <F6> :set spell spelllang=<cr>
noremap <F5> :set spell spelllang=pt,en<cr>
map <F8> :TagbarToggle<CR>
map <F9> :Neomake!<CR>:copen<CR>
noremap <F7> <Esc>:NERDTreeTabsToggle<CR>
map <C-n> <Esc>:tabnew<CR>
imap <C-s> <Esc>:w<CR>
map <C-s> <Esc>:w<CR>
imap <C-z> <Esc>:ui<CR>
map <C-z> <Esc>:u<CR>
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
