# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install-package.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbelondr <sbelondr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/04 16:14:14 by sbelondr          #+#    #+#              #
#    Updated: 2020/09/04 17:16:06 by askhalog         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# name package
PCK_INSTALL="apt-get install"
PCK_UPDATE="apt-get update"
PCK_UPGRADE="apt-get upgrade"
# arch -> base-devel
PCK_DEV="build-essential"

# redirect STD
R_STDOUT="/dev/null"

# version
V_PYTHON="3.8.5"
V_NODE="14"

# default file to save conf
RC=~/.zshrc

confirm() {
	read -r -p "$1? [y/N] " response
	case "$response" in
		[yY][eE][sS]|[yY]) 
			true
			;;
		*)
			false
			;;
	esac
}

install_base_package() {
	echo "Update..."
	sudo $PCK_UPDATE > $R_STDOUT
	echo "Upgrade..."
	sudo $PCK_UPGRADE -y > $R_STDOUT

	echo "Create ~/dev directory"
	mkdir -pv ~/dev

	echo "Install base package..."
	sudo $PCK_INSTALL -y $PCK_DEV > $R_STDOUT
	sudo $PCK_INSTALL -y vim emacs pandoc lynx terminator virtualbox htop > $R_STDOUT
	sudo $PCK_INSTALL -y curl wget git valgrind lldb > $R_STDOUT
	sudo $PCK_INSTALL -y joplin keepass2 docker docker-compose openssl > $R_STDOUT
}

conf_terminator() {
	echo "Config terminator..."
	mkdir -pv ~/.config/terminator
	cp config/terminator_config ~/.config/terminator/config
}

install_insomnia() {
	echo "Install insomnia..."
	# Add to sources
	echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
		| sudo tee -a /etc/apt/sources.list.d/insomnia.list > $R_STDOUT

	# Add public key used to verify code signature
	wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
		| sudo apt-key add - > $R_STDOUT

	# Refresh repository sources and install Insomnia
	sudo $PCK_UPDATE > $R_STDOUT
	sudo $PCK_INSTALL insomnia -y > $R_STDOUT
}

install_zsh() {
	echo "Install zsh and oh-my-zsh"
	sudo $PCK_INSTALL zsh -y > $R_STDOUT
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended


	echo "Add file config in zshrc"
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions > $R_STDOUT
	echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $RC
	cat config/zshrc >> $RC

}

install_nvm_pack() {
	echo "Install yarn..."
	npm i -g yarn > $R_STDOUT
	echo "Install lite-server..."
	npm i -g lite-server > $R_STDOUT
	echo "Install @vue/cli..."
	npm i -g @vue/cli > $R_STDOUT
	echo "Install @angular/cli..."
	npm i -g @angular/cli > $R_STDOUT
}

install_nvm() {
	echo "Install nvm..."
	echo "Go to https://github.com/nvm-sh/nvm and get link to install nvm (part Installing and Updating)"

	read -e -p "Enter link nvm install: " -i "https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh" nvm_link

	echo "Install nvm..."
	wget -qO- $nvm_link | bash > $R_STDOUT

	# update env script
	NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

	# update env zshrc
	echo "export NVM_DIR=\"$HOME/.nvm\"" >> $RC
	echo "[ -s "$NVM_DIR/nvm.sh" ] && \. \"$NVM_DIR/nvm.sh\"  # This loads nvm" >> $RC
	echo "[ -s "$NVM_DIR/bash_completion" ] && \. \"$NVM_DIR/bash_completion\"  # This loads nvm bash_completion" >> $RC

	# install one node version
	echo "Install node version $V_NODE..."
	nvm install $V_NODE > $R_STDOUT
	nvm use global $V_NODE > $R_STDOUT
	# install other package
	confirm "Install yarn, lite-server, vue and angular package" && install_nvm_pack
}

install_pyenv() {
	echo "Install pyenv"

	sudo $PCK_INSTALL -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
		libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev \
		libffi-dev liblzma-dev python3-openssl > $R_STDOUT

	curl https://pyenv.run | bash > $R_STDOUT

	PYENV_ROOT="$HOME/.pyenv"
	PATH="$PYENV_ROOT/bin:$PATH"

	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $RC
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $RC

	echo "Install python 3.8.5"
	pyenv install $V_PYTHON > $R_STDOUT
	pyenv global $V_PYTHON > $R_STDOUT

	echo "Install jupyterlab..."
	pip install jupyterlab > $R_STDOUT
}

conf_git() {
	echo "Edit git"

	read -p "Enter your git name: " git_name
	read -p "Enter your git mail: " git_mail
	git config --global user.name "$git_name"
	git config --global user.email "$git_mail"
}

echo "Script only work for Debian/Ubuntu"
confirm "Do you want install base package" && install_base_package
confirm "Add terminator config" && conf_terminator
confirm "Do you want install insomnia" && install_insomnia
confirm "Do you want install zsh and oh-my-zsh" && install_zsh || RC="~/.bashrc"
confirm "Do you want install nvm" && install_nvm
confirm "Do you want install pyenv" && install_pyenv
confirm "Do you want edit name and mail of git" && conf_git
confirm "Do you want install package for vim" && bash install-vimrc.sh
