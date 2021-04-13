#!/bin/bash

echo "Install and conf vim"

echo "copy vimrc in your home..."
cp ./config/vimrc ~/.vimrc

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

echo "Install 42 header..."
git clone https://github.com/42Paris/42header.git /tmp/header
cd /tmp/header/vim
mkdir -p ~/.vim/plugin
cp stdheader.vim ~/.vim/plugin
cd
rm -rf /tmp/header

if [ -z $1 ]; then
	read -p "Enter your 42 name: " header_name
	read -p "Enter your 42 email: " header_mail

	echo "export USER=$header_name" >> ~/.zshrc
	echo "export MAIL=$header_mail" >> ~/.zshrc
fi
