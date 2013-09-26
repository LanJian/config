" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Nov 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Utilities
Bundle 'pyflakes.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'wincent/Command-T'
"Bundle 'xolox/vim-notes'
"Bundle 'Flex-Development-Support'
Bundle 'ActionScript-3-Omnicomplete'
"Bundle 'Vim-JDE'
Bundle 'javacomplete'

" Syntax highlighting
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-liquid'
Bundle 'itspriddle/vim-jquery'
Bundle 'othree/html5.vim'
Bundle 'jade.vim'
Bundle 'haskell.vim'
Bundle 'vim-stylus'
Bundle 'nginx.vim'
Bundle 'JSON.vim'
Bundle 'groenewege/vim-less'

" Syntactic sugar
Bundle 'Twinside/vim-haskellConceal'

" Vim-JDE
"set cfu=VjdeCompletionFun
"let g:vjde_completion_key='<c-m>'
"let g:vjde_lib_path="/usr/local/android/platforms/android-18/android.jar"

" javacomplete
"autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"let g:java_classpath="/usr/local/android/platforms/android-18/android.jar"


" NERDTree
map <F2> :NERDTreeToggle<cr>

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" taglist
let Tlist_Use_Right_Window = 1
map <F3> :TlistToggle<cr>

" Eclim
let g:EclimBrowser='open'
nnoremap <silent> <leader>i :JavaImportOrganize<cr>
nnoremap <silent> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <cr> :JavaSearchContext<cr>
nnoremap <silent> <leader>c :JavaCorrect<cr>

" Eclim + Java
au BufNewFile,BufRead *.java    		let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
au BufNewFile,BufRead *.java        set ts=4
au BufNewFile,BufRead *.java        set shiftwidth=4

" Syntastic
let g:syntastic_enable_signs=1

" Flex Development
au BufNewFile,BufRead *.mxml    		setfiletype mxml
au BufNewFile,BufRead *.as          	setfiletype actionscript

" Spitfire files
au BufNewFile,BufRead *.spt    		setfiletype htmlcheetah

" actionscript tags
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

filetype plugin indent on
set ofu=syntaxcomplete#Complete

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" hightlight unwanted whitespace
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+\%#\@<!$/

" 80 char per line
highlight ColorColumn ctermbg=7
let &colorcolumn=join(range(81,999),",")
"set colorcolumn=80

set number
set autoindent
set ts=2
set shiftwidth=2
set smartindent
set smarttab
syntax  on
set nohls
"set background=dark
set expandtab

set ignorecase
set smartcase

set nohls

set incsearch

set gdefault

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack

nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
map <C-K> <C-W>k<C-W>_
map <C-J> <C-W>j<C-W>_
set wmh=0

nnoremap ; :



function! Putclip(type, ...) range
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@
  if a:type == 'n'
    silent exe a:firstline . "," . a:lastline . "y"
  elseif a:type == 'c'
    silent exe a:1 . "," . a:2 . "y"
  else
    silent exe "normal! `<" . a:type . "`>y"
  endif
  call system('putclip', @@)
  let &selection = sel_save
  let @@ = reg_save
endfunction

vnoremap <silent> <leader>y :call Putclip(visualmode(), 1)<CR>
nnoremap <silent> <leader>y :call Putclip('n', 1)<CR>

function! Getclip()
  let reg_save = @@
  let @@ = system('getclip')
  setlocal paste
  exe 'normal p'
  setlocal nopaste
  let @@ = reg_save
endfunction

nnoremap <silent> <leader>p :call Getclip()<CR>
