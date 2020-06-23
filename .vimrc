" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Create backup dir
if empty(glob('~/.vim/backup'))
  call mkdir($HOME.'/.vim/backup', 'p')
endif

call plug#begin('~/.vim/plugged')

" Utilities
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'sirver/ultisnips'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --rust-completer' }
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-speeddating'

" Colorschemes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-quantum'

" Syntax highlighting
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'groenewege/vim-less'
Plug 'neovimhaskell/haskell-vim'
Plug 'itspriddle/vim-jquery'
Plug 'kchmck/vim-coffee-script'
Plug 'chr4/nginx.vim'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'hashivim/vim-terraform'
Plug 'pangloss/vim-javascript'
Plug 'google/vim-jsonnet'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'

" Syntactic sugar
Plug 'Twinside/vim-haskellConceal'

call plug#end()

"set t_Co=256
"colorscheme Tomorrow-Night-Eighties
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_italic = 0
"colorscheme gruvbox
set background=dark
set termguicolors
let g:quantum_black=1
colorscheme quantum

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-json
let g:vim_json_syntax_conceal = 0

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" vim-markdown
let g:vim_markdown_folding_disabled=1

" vim-airline
set statusline=1
let g:airline_powerline_fonts=1
let g:airline_theme='quantum'

" tabular
nmap <F1> :Tabularize /
vmap <F1> :Tabularize /

" nerdtree
map <F2> :NERDTreeToggle<cr>

" tagbar
map <F8> :TagbarToggle<cr>

" fzf
nmap <C-p> :FZF<cr>

" python-mode
let g:pymode_python = 'python3'

" eclim
let g:EclimBrowser='gopen'
au BufNewFile,BufRead *.java nnoremap <silent> <leader>i :JavaImportOrganize<cr>
au BufNewFile,BufRead *.java nnoremap <silent> <leader>d :JavaDocSearch -x declarations<cr>
au BufNewFile,BufRead *.java nnoremap <silent> <cr> :JavaSearchContext<cr>
au BufNewFile,BufRead *.java nnoremap <silent> <leader>c :JavaCorrect<cr>
let g:EclimCompletionMethod = 'omnifunc'

" youcompleteme
let g:ycm_rust_src_path = $RUST_SRC_PATH
" disable javascript linting, this is done by ALE now
let g:ycm_filter_diagnostics = { 'javascript': { 'regex': [ '.*' ] } }

" syntastic
"let g:syntastic_enable_signs=1
"let g:syntastic_ruby_checkers=['rubocop', 'mri']

" vim-javascript
let g:javascript_plugin_flow = 1

" ale 
let g:ale_completion_enabled = 1
let g:ale_linters = { 
  \'javascript': ['eslint', 'flow'],
  \'typescript': ['tsserver'],
  \'rust': ['cargo'],
\}

" rust.vim
"let g:syntastic_rust_checkers = []

" ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" hightlight unwanted whitespace
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+\%#\@<!$/

" 80 char per line
set colorcolumn=80
hi ColorColumn ctermbg=237

set cursorline
set textwidth=0 wrapmargin=0
set number
set autoindent
set ts=2
set shiftwidth=2
set smartindent
set smarttab
syntax  on
set background=dark
set expandtab
set ignorecase
set smartcase
set incsearch    " do incremental searching
set gdefault
set history=50    " keep 50 lines of command line history
set ruler    " show the cursor position all the time
set showcmd    " display incomplete commands
set hlsearch
set backupdir=~/.vim/backup
set laststatus=2
set synmaxcol=200
set tabpagemax=100

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Deja\ Vu\ Sans\ Mono\ For\ Powerline\ 10

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  autocmd FilterWritePre * if &diff | setlocal wrap< | endif

  autocmd FileType rust setlocal colorcolumn=100

else

  set autoindent    " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
     \ | wincmd p | diffthis

"let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :!ag 

nmap <c-h> gT
nmap <c-l> gt

"nmap <c-h> <c-w>h
"nmap <c-l> <c-w>l
map <C-K> <C-W>k
map <C-J> <C-W>j
"set wmh=0

nnoremap ; :

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap + <C-a>
nnoremap - <C-x>

" show invisible characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
nnoremap <leader>i :set list!<cr>

" insert date
:nnoremap <F5> "=strftime("%m/%d/%Y")<CR>P
:inoremap <F5> <C-R>=strftime("%m/%d/%Y")<CR>
