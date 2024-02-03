#!/bin/bash

# Some variables
export PATH=$PATH:/home/mina/bin/
# export JAVA_HOME=/usr/java/jdk-13/bin/java
export BROWSER=surf
export term=wezterm
# This is set so I can easily try out different editors, no need to change all my aliases if i wanted to try out like neovim or anything else
export EDITOR="/bin/nvim"
# Some dir vars to make life easier for me :D
export GIT=/home/mina/Documents/stuff/git
export DOTF=/home/mina/Documents/stuff/git/dotfiles
export SUDO_ASKPASS=/home/mina/bin/dmenu_pass

# upon entering TTY 1 and Xorg is not running then launch it
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ -z $(pgrep -i xorg) ]] ; then
	startx .xinitrc
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

#export XDG_RUNTIME_DIR=/run/user/$(id -u)
