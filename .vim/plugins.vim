call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'

" Show color of color
Plug 'ap/vim-css-color'

" Close HTML/XML tags
Plug 'docunext/closetag.vim'

" <tab> autocomplete
Plug 'ervandew/supertab'
" Plug 'Shougo/deoplete.nvim'

" incsearch.vim provides simple improved incremental searching.
" You can use it comfortably like the default search(/, ?).
" It supports all modes (normal, visual, operator-pending mode),
" dot-repeat ., {offset} flags, and so on.
Plug 'haya14busa/incsearch.vim'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }

" Search tool
Plug 'mileszs/ack.vim'

" Highlight indentation
" Plug 'nathanaelkane/vim-indent-guides'

Plug 'qpkorr/vim-bufkill'

Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'

" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'

" Molokai colorscheme
Plug 'tomasr/molokai'

" gcc gcgc gcap
Plug 'tpope/vim-commentary'

" End structures automatically (do-end)
Plug 'tpope/vim-endwise'

" Vim sugar for the UNIX shell commands that need it the most.
" Plug 'tpope/vim-eunuch'

" Git commands wrapper
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'

" Manage runtime path
" Plug 'tpope/vim-pathogen'

" Repeat map as a whole
Plug 'tpope/vim-repeat'

" :Gbrowse to open current file on github
Plug 'tpope/vim-rhubarb'

" automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth'

" all about "surroundings": parentheses, brackets, quotes, XML tags, and more
" cs'" cs'<q> cst" ds" ysiw[
Plug 'tpope/vim-surround'

" Pairs of mappings
" ]q is :cnext. [q is :cprevious. ]a is :next. [b is :bprevious
" [<Space> and ]<Space> add newlines before and after the cursor line.
" [e and ]e exchange the current line with the one above or below it.
" And more other https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt
Plug 'tpope/vim-unimpaired'

" ALE and LSP client
Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-rails'
" Plug 'christoomey/vim-rfactory'

"Plug 'thoughtbot/vim-rspec'
Plug 'janko/vim-test'
Plug 'tpope/vim-dispatch'

" Move cursor by indentation
Plug 'jeetsukumaran/vim-indentwise'

" Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'

Plug 'tpope/vim-projectionist'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Return to en lang after return from insert mode
Plug 'lyokha/vim-xkbswitch'
Plug 'jiangmiao/auto-pairs'
" https://github.com/jgdavey/vim-blockle/issues/5
Plug 'jgdavey/vim-blockle'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'StanisLove/vim-spectator'
Plug 'pocke/rbs.vim'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'stephpy/vim-yaml'

" easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

call plug#end()
