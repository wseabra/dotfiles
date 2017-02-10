call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'	"folder navigator
Plug 'jistr/vim-nerdtree-tabs'	"nerdtree on all tabs
Plug 'scrooloose/nerdcommenter'	"commenter helper
Plug 'tpope/vim-fugitive'		"git integration
Plug 'airblade/vim-gitgutter' "git diff integration
Plug 'kshenoy/vim-signature'		"vim-signature is a plugin to place, toggle and display marks.
Plug 'ctrlpvim/ctrlp.vim'		"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'Raimondi/delimitMate'		"This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
Plug 'SirVer/ultisnips'		"UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug  'honza/vim-snippets'	"This repository contains snippets files for various programming languages.
Plug 'sheerun/vim-polyglot'		"A collection of language packs for Vim.
Plug 'ervandew/supertab'		"use of <tab> to all text insertion on code
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' "Lean & mean status/tabline for vim that's light as air.
Plug 'majutsushi/tagbar'		"side window with tags from the code
Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/neoinclude.vim' | Plug 'zchee/deoplete-clang' | Plug 'zchee/deoplete-jedi' | Plug 'artur-shaik/vim-javacomplete2' "autocomplete tools
Plug 'neomake/neomake'		"Linting code asynchronous
Plug 'a.vim'	"Switch between .c and .h files
Plug 'edkolev/tmuxline.vim' "tmux theme integration
Plug 'juanseabra/tender.vim', {'branch': 'suport_for_SignColumn'} "my fork of tender theme
Plug 'bling/vim-bufferline'
"themes to use when i'm on the mood
"Plug 'joshdick/onedark.vim
"Plug 'morhetz/gruvbox'
"Plug 'tomasr/molokai'
"Plug 'AlessandroYorba/Sidonia'
"Plug 'davb5/wombat256dave'
"Plug 'arcticicestudio/nord-vim'
"Plug 'ltlollo/diokai'
"Plug 'fneu/breezy'
"Plug 'monkoose/boa.vim'
"Plug 'jansenfuller/crayon'
Plug 'crusoexia/vim-monokai'
call plug#end()
