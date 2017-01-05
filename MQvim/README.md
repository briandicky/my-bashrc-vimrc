#Vimrc guidelines
This document briefly describe how to install plugin in vim environment.


##(From Vundle.vim)Vundle, the plug-in manager for Vim
Vundle is short for Vim bundle and is a Vim plugin manager.
It allows you to...
* keep track of and [configure] your plugins right in the `.vimrc`
* install configured plugins (a.k.a. scripts/bundle)
* update configured plugins
* search by name all available [Vim scripts]
* clean unused plugins up
* run the above actions in a *single keypress* with interactive mode

Vundle automatically...

* manages the runtime path of your installed scripts
* regenerates help tags after installing and updating

###Where is .vimrc file?
If you did not create .vimrc before, create one now.
```
cd ~
touch .vimrc
```

###How to install Vundle
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

