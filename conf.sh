#!/bin/bash
echo Installing brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo Installing dependency
brew install vim cmake python go nodejs

echo Installing Vim plugins
ln $(pwd)/.vimrc.1 ~/.vimrc
mkdir ~/.vim/tmp
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo Compiling YCM
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
