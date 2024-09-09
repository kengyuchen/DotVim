

Installation:

    git clone https://github.com/kengyuchen/DotVim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update


### Reference

1. http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
2. https://github.com/tpope/vim-pathogen
3. https://riptutorial.com/vim/example/13780/pathogen
