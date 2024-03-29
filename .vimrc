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
Plug 'chrisbra/csv.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'xolox/vim-misc'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-speeddating'
Plug 'google/vim-maktaba'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mhinz/vim-startify'
Plug 'npxbr/glow.nvim', {'branch': 'main'}
Plug 'tpope/vim-rhubarb'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'justinmk/vim-sneak'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'psf/black', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" Colorschemes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'wadackel/vim-dogrun'
Plug 'artanikin/vim-synthwave84'
Plug 'EdenEast/nightfox.nvim'
Plug 'marko-cerovac/material.nvim'

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
Plug 'bazelbuild/vim-bazel'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'cespare/vim-toml'
Plug 'NoahTheDuke/vim-just'

" Syntactic sugar
Plug 'Twinside/vim-haskellConceal'

call plug#end()

set background=dark
set termguicolors

" colorscheme

"let g:quantum_black=1
"let g:quantum_italics=1
"colorscheme quantum

"let g:tokyonight_style = 'night'
"let g:tokyonight_italic_keywords = 0
"colorscheme tokyonight

"let g:material_style = 'deep ocean'
"let g:material_italic_comments = 1
"colorscheme material
colorscheme nightfox

let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-json
let g:vim_json_syntax_conceal = 0

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

" vim-markdown
let g:vim_markdown_folding_disabled=1

" tabular
nmap <F1> :Tabularize /
vmap <F1> :Tabularize /

" nerdtree
map <F2> :NERDTreeToggle<cr>

" tagbar
map <F8> :TagbarToggle<cr>

" fzf
nmap <C-p> :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>rg :Rg<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" eclim
let g:EclimBrowser='gopen'
au BufNewFile,BufRead *.java nnoremap <silent> <leader>i :JavaImportOrganize<cr>
au BufNewFile,BufRead *.java nnoremap <silent> <leader>d :JavaDocSearch -x declarations<cr>
au BufNewFile,BufRead *.java nnoremap <silent> <cr> :JavaSearchContext<cr>
au BufNewFile,BufRead *.java nnoremap <silent> <leader>c :JavaCorrect<cr>
let g:EclimCompletionMethod = 'omnifunc'

" ale 
let g:ale_enabled = 0

" coc
source ~/.config/nvim/coc.vim

" poet-v
let g:poetv_executables = ['poetry']
let g:poetv_auto_activate = 1

" indent-blankline
"let g:indent_blankline_char = '¦'
let g:indent_blankline_space_char = '·'
let g:indent_blankline_filetype_exclude = ['help', 'vim', 'startify', 'vimwiki']
let g:indent_blankline_show_current_context = v:true

" startify
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ ]
let g:startify_change_to_dir = 0
let g:startify_fortune_use_unicode = 1
"let g:ascii = [
      "\ '        __',
      "\ '.--.--.|__|.--------.',
      "\ '|  |  ||  ||        |',
      "\ ' \___/ |__||__|__|__|',
      "\ ''
      "\]
"let g:startify_custom_header =
      "\ 'startify#pad(g:ascii + startify#fortune#cowsay())'
"

" fugitive
nnoremap <leader>gh :GBrowse!<cr>
vnoremap <leader>gh :GBrowse!<cr>

lua << EOF
require("plugins/bufferline")
require("plugins/devicons")
require("plugins/gitsigns")
require("plugins/lualine")
require("plugins/nightfox")
require("plugins/treesitter")
EOF

" vim-sneak
let g:sneak#label = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" 80 char per line
set colorcolumn=80

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
set guifont=MesloLGS\ NF\ Regular

set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom highlights
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quantum
"hi IndentBlanklineChar cterm=nocombine ctermfg=12 gui=nocombine guifg=#303333
"hi IndentBlanklineSpaceChar cterm=nocombine ctermfg=12 gui=nocombine guifg=#303333
"hi IndentBlanklineSpaceCharBlankline cterm=nocombine ctermfg=12 gui=nocombine guifg=#303333

" for tokyonight: override colorcolumn
"hi CursorLine cterm=underline guibg=#232433
"hi ColorColumn cterm=underline guibg=#232433

" nightfox
hi IndentBlanklineChar cterm=nocombine ctermfg=darkgray gui=nocombine guifg=#15222e
hi IndentBlanklineSpaceChar cterm=nocombine ctermfg=darkgray gui=nocombine guifg=#15222e
hi IndentBlanklineSpaceCharBlankline cterm=nocombine ctermfg=darkgray gui=nocombine guifg=#15222e

hi CocInlayHint cterm=nocombine,italic ctermfg=darkgray gui=nocombine,italic guifg=#4b364d guibg=none
hi CocInlayHintType cterm=nocombine,italic ctermfg=darkgray gui=nocombine,italic guifg=#4b364d guibg=none
hi CocInlayHintParameter cterm=nocombine,italic ctermfg=darkgray gui=nocombine,italic guifg=#2f484d guibg=none

hi CocCodeLens guifg=#3d5166

hi CocErrorVirtualText term=italic gui=italic guifg=#c94f6d
hi CocWarningVirtualText term=italic gui=italic guifg=#f4a261
hi CocHintVirtualText term=italic gui=italic guifg=#15aabf

hi DiagnosticError guifg=#c94f6d
hi DiagnosticWarn guifg=#f4a261
hi DiagnosticHint guifg=#15aabf

hi CocErrorSign term=italic gui=italic guifg=#c94f6d
hi CocWarningSign term=italic gui=italic guifg=#f4a261
hi CocHintSign term=italic gui=italic guifg=#15aabf

hi ColorColumn guibg=#1e2938
hi FloatBorder cterm=nocombine,italic ctermfg=darkgray gui=nocombine,italic guifg=#00adad

"hi GitSignsAdd guifg=#266d6a
"hi GitSignsChange guifg=#b366b2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end custom highlights
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

  " python black defaults to 88 chars ¯\_(ツ)_/¯
  autocmd FileType python setlocal colorcolumn=88

  autocmd FileType terraform setlocal colorcolumn=100

  " auto run black on python file save
  autocmd BufWritePre *.py execute ':Black'

  " gopass
  au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

  " dockerfile
  autocmd BufEnter Dockerfile.* :setlocal filetype=dockerfile
else

  set autoindent    " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
     \ | wincmd p | diffthis

" move between buffers
nmap <c-h> :bp<cr>
nmap <c-l> :bn<cr>

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
nnoremap <F5> "=strftime("%Y-%m-%d")<CR>P
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

" plugin/syntax.vim

" Output the highlight group under the cursor
"
" This function will output the entire stack of hightlight groups being applied. The stack is
" outputted in the correct order from top to bottom. Vim will walk through the stack from top to
" bottom and apply the first defined highlight group found.
function! SynStack()
  for i1 in synstack(line("."), col("."))
    let i2 = synIDtrans(i1)
    let n1 = synIDattr(i1, "name")
    let n2 = synIDattr(i2, "name")
    echo n1 "->" n2
  endfor
endfunction

" You can also create a convenience mapping
map <F3> <cmd>call SynStack()<cr>
