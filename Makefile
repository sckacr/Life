export GOPATH := ${HOME}/go
export npm_config_prefix := ${HOME}/node_modules
export CLOUDSDK_PYTHON := python2

all: pacman yay aur git heroku docker x zsh vim i3 rofi termite ghq cloud-sdk

pacman:
	sudo pacman -Syu --noconfirm \
		dialog xorg xorg-xinit pulseaudio xdg-user-dirs i3 rofi feh termite gnome-screenshot \
		noto-fonts noto-fonts-cjk noto-fonts-emoji fcitx fcitx-im fcitx-mozc fcitx-configtool \
		zsh gvim git tig xsel xclip fzy tree python python2 go npm openssh mariadb dbeaver docker docker-compose

yay:
	git clone https://aur.archlinux.org/yay.git
	cd yay; makepkg -si --noconfirm
	rm -rf yay

aur: yay
	yay -Syu --noconfirm direnv jetbrains-toolbox google-chrome

git:
	ln -sfv ${PWD}/.gitconfig ${HOME}/.gitconfig

heroku:
	npm i -g heroku

docker:
	sudo usermod -aG docker ${USER}
	sudo systemctl enable docker

x: pacman
	ln -sfv ${PWD}/.xinitrc ${HOME}/.xinitrc
	ln -sfv ${PWD}/.xprofile ${HOME}/.xprofile
	LANGUAGE=en xdg-user-dirs-update --force

zsh:
	curl -sL --proto-redir -all,https \
		https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
	ln -sfv ${PWD}/.zlogin ${HOME}/.zlogin
	ln -sfv ${PWD}/.zshrc ${HOME}/.zshrc

vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -sfv ${PWD}/.vimrc ${HOME}/.vimrc
	ln -sfv ${PWD}/.gvimrc ${HOME}/.gvimrc

i3:
	mkdir -p ${HOME}/.config/i3status
	ln -sfv ${PWD}/.config/i3status/config ${HOME}/.config/i3status/config
	mkdir -p ${HOME}/.config/i3
	ln -sfv ${PWD}/.config/i3/config ${HOME}/.config/i3/config

rofi:
	mkdir -p ${HOME}/.config/rofi
	ln -sfv ${PWD}/.config/rofi/config ${HOME}/.config/rofi/config

termite:
	mkdir -p ${HOME}/.config/termite
	ln -sfv ${PWD}/.config/termite/config ${HOME}/.config/termite/config

ghq:
	go get -u -v github.com/motemen/ghq

cloud-sdk:
	curl https://sdk.cloud.google.com |  bash
