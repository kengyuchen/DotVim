

## Installation
Install with plugin

    git clone --recursive https://github.com/kengyuchen/DotVim.git ~/.vim

If already cloned

    git submodule update --init --recursive

Or install without submodule plugin

    git clone https://github.com/kengyuchen/DotVim.git ~/.vim

## Symbolic Link

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

## Plugin
Add a plugin

    git submodule add https://github.com/<plugin-url> ~/.vim/bundle/<plugin-name>

Update a plugin

    cd ~/.vim/bundle/<plugin-name>
    git pull origin main


### Reference

1. http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
2. https://github.com/tpope/vim-pathogen
3. https://riptutorial.com/vim/example/13780/pathogen
