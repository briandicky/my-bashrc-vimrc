# Vimrc guidelines
This document briefly describe how to install plugin in vim environment.

## [Vundle](https://github.com/VundleVim/Vundle.vim), the plug-in manager for Vim
Vundle is short for Vim bundle and is a Vim plugin manager.
It allows you to...
* keep track of and configure your plugins right in the `.vimrc`
* install configured plugins (a.k.a. scripts/bundle)
* update configured plugins
* search by name all available Vim scripts
* clean unused plugins up
* run the above actions in a *single keypress* with interactive mode

Vundle automatically...

* manages the runtime path of your installed scripts
* regenerates help tags after installing and updating

### Where is .vimrc file?
If you did not create .vimrc before, create one now.
    `touch ~/.vimrc`

### How to install Vundle
1. create the directory if you did not create it before.
    ```
    cd ~
    mkdir .vim
    cd .vim
    mkdir bundle
    ```

2. use git to clone the vundle source code form github.
    ```
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```

3. configure plugins:
Put this at the top of your `.vimrc` to use Vundle. Remove plugins you don't need, they are for illustration purposes.
    ```vim
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    Plugin 'tpope/vim-fugitive'
    " plugin from http://vim-scripts.org/vim/scripts.html
    Plugin 'L9'
    " Git plugin not hosted on GitHub
    Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
    Plugin 'file:///home/gmarik/path/to/plugin'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Install L9 and avoid a Naming conflict if you've already installed a
    " different version somewhere else.
    Plugin 'ascenator/L9', {'name': 'newL9'}

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
    ```

4. Install plugins:
Launch vim and run `:PluginInstall`
To install from command line: `vim +PluginInstall +qall`

## [YouCompleteMe](https://github.com/Valloric/YouCompleteMe), a code-completion engine for Vim
YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim.
Please refer to the full Installation Guide below, however, the following commands are provided on my own experience and may not work for you.

### For Ubuntu Linux x64
1. environment:
Make sure you have Vim 7.4.143 with Python 2 or Python 3 support.
Ubuntu 14.10 and later version should have a Vim that's recent enough.
You can see the version of Vim installed by running this.
    ```
    vim --version
    ``` 
If the version is too old, you may need to compile Vim from source.

2. Now, install YouCompleteMe with Vundle, adding this in your vimrc's Vundle plugins.
    ```
    Plugin 'Valloric/YouCompleteMe'
    ```
3. Then install the plugins.
    ```
    vim
    :PluginInstall
    ```

4. Install development tools and CMake.
    ```
    sudo apt-get install build-essential cmake
    ```

5. Make sure you have Python headers installed.
    ```
    sudo apt-get install python-dev python3-dev
    ```

6. Compiling YCM with semantic support for C-family languages:
    ```
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
    ```

    Compiling YCM without semantic support for C-family languages:
    ```
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py
    ```
7. configuration in my vimrc:
Before we start to use YouCompleteMe, we need to set a global variable to be the entry point of YCM for all code. Add this line in your vimrc.
    ```
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
    ```
After you set this global variable to be the enyrt point for YCM, it will work successfully.

## [Vim-airline](https://github.com/vim-airline/vim-airline), status/tabline for vim
Lean & mean status/tabline for vim that's light as air.

### Installation
For Vundle manager, we install main tool by typing
```
Plugin 'vim-airline/vim-airline'
```

If you want to install the themes as you would this plugin ([Vundle themes](https://github.com/vim-airline/vim-airline-themes))
```
Plugin 'vim-airline/vim-airline-themes'
```

Then, launch vim and run `:PluginInstall`.

###Settings
Below is my vim-airline settings.
```vim
" set status line
set laststatus=2
" set colors
set t_Co=256
" set endoing format
set encoding=utf-8
" enable powerline-fonts
" set fonts size
let g:airline_powerline_fonts=1
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
```

## [NERDTree](https://github.com/scrooloose/nerdtree), a tree explorer plugin for vim
The NERD tree allows you to explore your filesystem and to open files and directories.

### Installaltion
For Vundle manager, we install main tool by typing
```
Plugin 'scrooloose/nerdtree'
```

Then, launch vim and run `:PluginInstall`.

### Settings
Below is my NERDtree settings.
```vim
" F2 to open/close nerd tree 
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
" show bookmark
let NERDTreeShowBookmarks=1
" ignore document type
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" window size
let NERDTreeWinSize=25
```

## [Tagbar](https://github.com/majutsushi/tagbar), a class outline viewer for Vim
Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure.
It does this by creating a sidebar that displays the ctags-generated tags of the current file, ordered by their scope.

### Installation
For Vundle manager, we install main tool by typing
```
Plugin 'majutsushi/tagbar'
```

Then, launch vim and run `:PluginInstall`.

### Settings
Below is my Tagbar settings, more details you can find [here](https://github.com/majutsushi/tagbar/blob/master/doc/tagbar.txt).
```vim
" F3 to open/close tagbar
map <F3> :TagbarToggle<CR>
" Jump to tagbar window on open
let g:tagbar_autofocus = 1
" If you set this option the Tagbar window will automatically close when you
" jump to a tag
let g:tagbar_autoclose = 0
" Width of the Tagbar window in characters
le g:tagbar_width = 35
```

## [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim), a fuzzy file, buffer, mru, tag, etc finder for vim
ctrlp.vim is a full path fuzzy file, buffer, mru, tag, ... finder for vim.

### Installation
For Vundle manager, we install main tool by typing
```
Plugin 'ctrlpvim/ctrlp.vim'
```

Then, launch vim and run `:PluginInstall`.

### Settings
Below is my ctrl.vim settings, more details you can find [here](https://github.com/ctrlpvim/ctrlp.vim/blob/master/doc/ctrlp.txt).
```vim
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
```

## [Cscope](http://cscope.sourceforge.net/),  a developer's tool for browsing source code
Cscope support is built into Vim (so long as it is compiled with the '--enable-cscope' option--this is the case for most binary distributions). 
The Vim interface, and a set of key mappings you may find useful, is documented in the [Vim/Cscope Tutorial](http://cscope.sourceforge.net/cscope_vim_tutorial.html).

### Installation
Type this command in your terminal, it will automatically install cscope.
```script
sudo apt-get install cscope
```

### Settings
Below is my cscope.vim settings, more details you can find [here](http://cscope.sourceforge.net/cscope_maps.vim).
```vim
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
```
