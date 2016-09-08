set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" For ColorScheme
Plugin 'chriskempson/base16-vim'
" For diff
Plugin 'airblade/vim-gitgutter'
" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
" Move lines up and down
Plugin 'matze/vim-move'
"Tree with branches
Plugin 'mbbill/undotree'
" Syntx autocheck
Plugin 'scrooloose/syntastic'
" Autoclose end
Plugin 'tpope/vim-endwise'
" Vertical align code
Plugin 'junegunn/vim-easy-align'
" Highlight whitespace
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'slim-template/vim-slim.git'

Plugin 'kchmck/vim-coffee-script'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Base Config {{{
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default
syntax on
let mapleader = ","
runtime macros/matchit.vim
set autoindent
set autoread
set backspace=indent,eol,start
set binary
set cmdheight=2
set complete-=i
set completeopt=menuone,preview
set equalalways
set expandtab
set fillchars+=stl:\ ,stlnc:\
set foldmethod=indent
set foldnestmax=3
set hidden
set history=10000
set ignorecase
set incsearch
set hlsearch
set infercase
set laststatus=2
set lazyredraw
set nobackup
set nofoldenable
set noswapfile
set nowritebackup
set number
set numberwidth=4
set ruler
set scrolloff=3
set shell=/usr/local/bin/zsh
set shiftwidth=2
set shortmess=atI
set showcmd
set showmatch
set showtabline=2
set sidescroll=1
set sidescrolloff=15
set smartcase
set softtabstop=2
set splitright
set synmaxcol=1000
set t_Co=16
set t_ti= t_te=
set tabstop=2
set textwidth=0
set title
set ttyfast
set undodir='/tmp'
set undofile
set visualbell
set whichwrap=b,s,h,l,<,>,[,],~
set wildignore=.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.swf,*.egg,*.jar,*.dump,*.gem
set wildmenu
set wildmode=longest,list
set wrap linebreak textwidth=0
nnoremap <F4> :NERDTree<cr>
nnoremap <F5> :UndotreeToggle<cr>
" }}}

" Autocmd Basic {{{
augroup vimrcEx
  " Remove all previously defined autocmds
  au!

  " Automatically create parent directory on save if directory doesn't exist
  au BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif

  " Move to the last edited location
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Fugitive - remove when done
  au BufReadPost fugitive://* set bufhidden=delete

  " Force syntax highlighting for bufdo
  au BufWinEnter * nested if exists('syntax_on') && ! exists('b:current_syntax') && ! empty(&l:filetype) | syntax enable | endif
  au BufRead * if exists('syntax_on') && exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') != -1 | unlet! b:current_syntax | endif

  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="
  au BufNewFile * set noeol

  " Track Quickfix Window
"  au BufWinEnter quickfix call GetQuickFixBufferNumber()
"  au BufWinLeave * call CheckIsQuickfixWindowClosing()
" }}}
" Autocmd Files {{{
  au BufWinEnter,BufRead,BufNewFile Gemfile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Rakefile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Guardfile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Thorfile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Gruntfile set ft=javascript
  au BufWinEnter,BufRead,BufNewFile *.fdoc set ft=yaml
  au BufWinEnter,BufRead,BufNewFile *.md set ft=markdown
  au BufWinEnter,BufRead,BufNewFile *.slim set ft=slim
  au BufWinEnter,BufRead,BufNewFile *.skim set ft=ruby
  au BufWinEnter,BufRead,BufNewFile *.jbuilder set ft=ruby

  " Automatically reload vimrc when it's saved
  au BufWritePost .vimrc source ~/.vimrc|set fdm=marker|AirlineRefresh
  au FileType vim set fdm=marker
  au SourceCmd .vimrc set fdm=marker|AirlineRefresh

  au FileType slim set commentstring=/\ %s
 
  if did_filetype()
    finish
  endif
  if getline(1) =~# '^#!.*/bin/env\s\+node\>'
    setfiletype javascript
  endif
  if getline(1) =~# '^#!.*/bin/env\s\+ruby\>'
    setfiletype ruby
  endif
" }}}
" Autocmd Plugin Bookmarks (Command Aliases) {{{
"  au VimEnter * CmdAlias ea EasyAlign
"  au VimEnter * CmdAlias ut UndotreeToggle
"  "au VimEnter * CmdAlias vs call\ GoldenView#Split()
"  au VimEnter * CmdAlias tr StripWhitespace
"  au VimEnter * CmdAlias nt NERDTree
"  au VimEnter * CmdAlias --Plugins-- ---------------------
"  au VimEnter * CmdAlias d Dispatch
"  au VimEnter * CmdAlias dl RSpecLine
"  au VimEnter * CmdAlias df RSpecFile
"  au VimEnter * CmdAlias --Testing-- ---------------------
"  au VimEnter * CmdAlias ch e\ cheat.md
"  au VimEnter * CmdAlias vi tabedit\ ~/.vimrc
"  au VimEnter * CmdAlias so source\ ~/.vimrc
"  au VimEnter * CmdAlias vip tabedit\ .vimrc-private
"  au VimEnter * CmdAlias sop source\ .vimrc-private
"  au VimEnter * CmdAlias tm tabedit\ ~/.tmux.conf
"  au VimEnter * CmdAlias zs tabedit\ ~/.zshrc
"  au VimEnter * CmdAlias ---Files--- ---------------------
"  au VimEnter * CmdAlias j join
"  au VimEnter * CmdAlias r reg\ 123456789 1
"  au VimEnter * CmdAlias be bufdo\ e!
"  au VimEnter * CmdAlias ---Basic--- ---------------------
"  au VimEnter * CmdAlias a CmdAlias!
"  au VimEnter * CmdAlias q exec\ DWM_Close()
augroup END
" }}}                  
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
