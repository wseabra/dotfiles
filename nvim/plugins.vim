call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'	"folder navigator
Plug 'jistr/vim-nerdtree-tabs'	"nerdtree on all tabs
Plug 'scrooloose/nerdcommenter'	"commenter helper
Plug 'tpope/vim-fugitive'		"git integration
Plug 'airblade/vim-gitgutter' "git diff integration
Plug 'kshenoy/vim-signature'		"vim-signature is a plugin to place, toggle and display marks.
Plug 'ctrlpvim/ctrlp.vim'		"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'jiangmiao/auto-pairs'		"Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'SirVer/ultisnips'		"UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug  'honza/vim-snippets'	"This repository contains snippets files for various programming languages.
Plug 'ervandew/supertab'		"use of <tab> to all text insertion on code
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' "Lean & mean status/tabline for vim that's light as air.
Plug 'majutsushi/tagbar'		"side window with tags from the code
Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/neoinclude.vim' | Plug 'zchee/deoplete-clang' | Plug 'zchee/deoplete-jedi' | Plug 'artur-shaik/vim-javacomplete2' | Plug 'poppyschmo/deoplete-latex' | Plug 'Shougo/neco-vim' "autocomplete tools
Plug 'OmniSharp/omnisharp-vim'
Plug 'neomake/neomake'		"Linting code asynchronous
Plug 'lervag/vimtex'	"latex support
"Plug 'morhetz/gruvbox'	"gruvbox theme
"Plug 'tomasr/molokai'	"molokai theme
Plug 'joshdick/onedark.vim'
call plug#end()
