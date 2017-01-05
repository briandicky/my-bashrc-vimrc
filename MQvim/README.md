#Vimrc guidelines
This document briefly describe how to install plugin in vim environment.


##(From Vundle.vim) Vundle, the plug-in manager for Vim
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

##YouCompleteMe, a code-completion engine for Vim
YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim.
Please refer to the full Installation Guide below, however, the following commands are provided on my own experience and may not work for you.

###For Ubuntu Linux x64
1. environment:
Make sure you have Vim 7.4.143 with Python 2 or Python 3 support.
Ubuntu 14.10 and later version should have a Vim that's recent enough.
You can see the version of Vim installed by running this.
```
vim --version
``` 
If the version is too old, you may need to compile Vim from source.

Now, install YouCompleteMe with Vundle, adding this in your vimrc's Vundle plugins.
```
Plugin 'Valloric/YouCompleteMe'
```
Then install the plugins.
```
vim
:PluginInstall
```

Install development tools and CMake.
```
sudo apt-get install build-essential cmake
```

Make sure you have Python headers installed.
```
sudo apt-get install python-dev python3-dev
```

Compiling YCM with semantic support for C-family languages:
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

Compiling YCM without semantic support for C-family languages:
```
cd ~/.vim/bundle/YouCompleteMe
./install.py
```
