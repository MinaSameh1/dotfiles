## Some variables and Path modifications
## Only source this file ONCE

## Installs fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

## Run these once
set -U JAVA_HOME /usr/lib/jvm/java-17-openjdk/
set -U _JAVA_AWT_WM_NONREPARENTING 1
set -U git /home/mina/Documents/stuff/git
set -U SUDO_ASKPASS /home/mina/bin/dmenu_pass
set -U BROWSER firefox-developer-edition
set -U TERM wezterm
set -U EDITOR /bin/nvim
set -U VISUAL /bin/nvim
set -U PYENV_ROOT "$HOME/.pyenv"

fish_add_path $HOME/.local/bin $HOME/bin

# fish_add_path $HOME/.local/share/gem/ruby/3.0.0/bin $PYENV_ROOT/shims $PYENV_ROOT/bin $HOME/.cargo/bin $HOME/.local/share/flatpak/exports/share $HOME/.luarocks/bin
