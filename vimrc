" =============================================
" Author:   Wen-Chih, MosQuito, Lo
" Date:     2016.12.17
" Purpose:  This is my own vimrc settings.
" =============================================

" =============================================
" Normal settings
" =============================================
" Settings for interface optimization
set nu
set ai
set bg=dark
set cursorline
set ruler
set expandtab
set hlsearch
set ignorecase
syntax on

" fix mac vim delete error, so as set backspace=indent,eol,start
"set backspace=2

" enable filetype detection:
filetype on
filetype plugin on
filetype indent on

" For normal file, expand tabs to spaces.
set tabstop=4
set shiftwidth=4

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType Makefile set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType makefile set noexpandtab shiftwidth=8 softtabstop=0

" For *.tex files, do not set autoindent off.
autocmd BufRead *.tex set noautoindent nocindent nosmartindent indentexpr=
autocmd BufRead *.tex nnoremap <F8> :setl noai nocin nosi inde=<CR>

" For *.tex, *.md, *.txt, markdown, and gitcommit files, open spell checker automatically
if has("spell")
  " turn on spell checker when open following files
  autocmd BufRead *.txt,*.md,*.tex,*.html set spell
  autocmd FileType markdown set spell
  autocmd FileType gitcommit set spell

  " toggle spelling with F4 key
  " map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

  " they were using white on white
  highlight PmenuSel ctermfg=black ctermbg=lightgray

  " limit it to just the top 10 items
  " set sps=best,10                    
endif

" Save with sripping trailing spaces
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.h,*.c,*.java :call <SID>StripTrailingWhitespaces()

" =============================================
" End of normal settings
" =============================================


" =============================================
"   Start vundle
" =============================================
" Vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" =============================================
"   Write your plugins here
" =============================================
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'L9'

" =============================================
" Run vundle
" =============================================
" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on


"""""""""""""""""""""""""" 
" settins for YCM
"""""""""""""""""""""""""" 
"" set a global var to be the entry point of YCM for all code
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"" <Enter> used to select the completion string without newline
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"" seed its identifier database with the keywords of the programming language you're writing
"" let g:ycm_seed_identifiers_with_syntax = 1
"" show the completion menu even when typing inside comments
"let g:ycm_complete_in_comments = 1


""""""""""""""""""""""""""
" settings for vim-airline
""""""""""""""""""""""""""
" set status line
set laststatus=2
" set colors
set t_Co=256
" set endoing format
set encoding=utf-8
" enable powerline-fonts
" set fonts size
"let g:airline_powerline_fonts=1
" set vim-airline theme
let g:airline_theme="simple"
" enable tabline
"let g:airline#extensions#tabline#enabled = 1
" set left separator
"let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
"let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
"let g:airline#extensions#tabline#buffer_nr_show = 1


""""""""""""""""""""""""""
" settings for Nerdtree
""""""""""""""""""""""""""
" F2 to open/close nerd tree 
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
" show bookmark
let NERDTreeShowBookmarks=1
" ignore document type
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" window size
let NERDTreeWinSize=25
" close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""
" settings for Tagbar
""""""""""""""""""""""""""
" F3 to open/close tagbar
map <F3> :TagbarToggle<CR>
" Jump to tagbar window on open
let g:tagbar_autofocus = 1
" If you set this option the Tagbar window will automatically close when you
" jump to a tag
let g:tagbar_autoclose = 0
" Width of the Tagbar window in characters
let g:tagbar_width = 25


""""""""""""""""""""""""""
" settings for ctrl.vim
""""""""""""""""""""""""""
" Use this option to change the mapping to invoke CtrlP in normal mode
let g:ctrlp_map = '<leader>p'
" Set the default opening command to use when pressing the above mapping
let g:ctrlp_cmd = 'CtrlP'
" F4 to open/close ctrl.vim
map <F4> :CtrlPMRU<CR>
"  Use this for files and directories you want only CtrlP to not show
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$'}
" When starting up, CtrlP sets its local working directory
let g:ctrlp_working_path_mode=0
" Change the position, the listing order of results, the minimum and the maximum heights of the match window
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
" Specify the number of recently opened files you want CtrlP to remembe
let g:ctrlp_mruf_max=500
" Follow symbolic links or not
let g:ctrlp_follow_symlinks=1

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim..
if has("cscope")
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out

    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
