#!/bin/bash

echo "copy vimrc in your home..."
cp vimrc ~/.vimrc

echo "Install pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Install gruvbox..."
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

echo "Install airline..."
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

echo "Install syntastic..."
cd ~/.vim/bundle && git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

echo "Install nerdtree..."
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree


echo "Finish!"
