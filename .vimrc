" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

" Utilities
Plugin 'bling/vim-airline'
Plugin 'chrisbra/csv.vim'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pyflakes.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sirver/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'myusuf3/numbers.vim'

" Colorschemes
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'morhetz/gruvbox'

" Syntax highlighting
Plugin 'JSON.vim'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'haskell.vim'
Plugin 'itspriddle/vim-jquery'
Plugin 'jade.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nginx.vim'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-rails'
Plugin 'valloric/youcompleteme'
Plugin 'vim-stylus'
Plugin 'markcornick/vim-terraform'

" Syntactic sugar
Plugin 'Twinside/vim-haskellConceal'

call vundle#end()

set t_Co=256
"colorscheme Tomorrow-Night-Eighties
let g:gruvbox_contrast = 'hard'
let g:gruvbox_italic = 0
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" ctrlp.vim
let g:ctrlp_working_path_mode = ''

" vim-markdown
let g:vim_markdown_folding_disabled=1

" vim-airline
set statusline=1
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'

" tabular
nmap <F1> :Tabularize /
vmap <F1> :Tabularize /

" nerdtree
map <F2> :NERDTreeToggle<cr>

" tagbar
map <F8> :TagbarToggle<cr>

" eclim
let g:EclimBrowser='open'
au BufNewFile,BufRead *.java nnoremap <silent> <leader>i :JavaImportOrganize<cr>
au BufNewFile,BufRead *.java nnoremap <silent> <leader>d :JavaDocSearch -x declarations<cr>
au BufNewFile,BufRead *.java nnoremap <silent> <cr> :JavaSearchContext<cr>
au BufNewFile,BufRead *.java nnoremap <silent> <leader>c :JavaCorrect<cr>
au BufNewFile,BufRead *.java let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
au BufNewFile,BufRead *.java set ts=4
au BufNewFile,BufRead *.java set shiftwidth=4

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_ruby_checkers=['rubocop', 'mri']

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

else

  set autoindent    " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
     \ | wincmd p | diffthis

"let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :!ack 

nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
map <C-K> <C-W>k<C-W>_
map <C-J> <C-W>j<C-W>_
set wmh=0

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
