#!/bin/env bash
# vim:ft=sh
#   _               _              _ _
#  | |__   __ _ ___| |__      __ _| (_) __ _ ___  ___  ___
#  | '_ \ / _` / __| '_ \    / _` | | |/ _` / __|/ _ \/ __|
# _| |_) | (_| \__ \ | | |  | (_| | | | (_| \__ \  __/\__ \
#(_)_.__/ \__,_|___/_| |_|___\__,_|_|_|\__,_|___/\___||___/
#                       |_____|

# Change my PS1 to the default
alias change-ps1='PS1="\[\e[92m\][\[\e[91m\]\u\[\e[93m\]@\[\e[96m\]\h\[\e[94m\]:\W\[\e[92m\]]\[\e[93m\]\$"'

# Switch audio output
alias audio-laptop='pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo'
alias audio-hdmi='pacmd set-card-profile 0 output:hdmi-stereo+input:analog-stereo'
# Tmux killall and kill window command
alias tkill='tmux kill-server'
alias tend='tmux kill-session'
# Youtube viwer and youtube dl stuff
alias YT='youtube-viewer'
alias DL='youtube-dl'
alias DM='youtube-dl -f bestaudio'
alias ls='ls --color=auto'
# aliases for quickly using commands
alias r='ranger'
alias edit='$EDITOR'
# alias v='vim'
alias vim='nvim'
alias m='ncmpcpp'
alias l='ls -lah --color=auto'
alias py='python3'
alias i3lock='i3lock --image=/home/mina/.config/lock.png'
alias dog='tac'
# Help!
alias Help="echo Stay calm, you can do this $USER!"
# Some sudo quickys and sys updates
#alias emergeUpdate='emerge -av --update --deep --newuse @world'
#alias esearch='sudo emerge --search'
#alias PYbrokePAC='sudo pacman -S $(pacman -Qqo /usr/lib/python3.8/)'
#alias showpackages="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
#alias voidUpdate='sudo xbps-install -Su'
alias p='sudo pacman'
alias s='sudo'
alias please='sudo "$BASH" -c "$(history -p !!)"'
# Start NetworkManager, can be compined with other services like startN sshd
alias startN='sudo systemctl start NetworkManager'
alias journalctl='sudo journalctl'
#alias hibernate='sudo -i "echo disk > /sys/power/state"'
# Ask before removing,copying and moving files
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Readable formats for the command outputs
alias df='df -h'
alias free='free -m'
# Readd the background
alias feh-reset='feh --bg-fill /home/mina/.config/background.jpg'
# Get weather status
alias weather-status='curl wttr.in'
# Aliases for spotify, the second is a variable being assigned bec spotify sometimes breaks and forgets where to output audio
alias spotify='flatpak run com.spotify.Client'
alias spotify2p='PULSE_SERVER=unix:/tmp/pulse-PKdhtXMmr18n/native flatpak run com.spotify.Client'
# Open Surf with tabbed
alias surftabbed='tabbed surf -e'

# Reload the colors if needed!
alias walr='wal -r'

# FreeDOS vm
alias FreeDos='sudo qemu-system-x86_64 -hda /home/mina/Downloads/Operating_Systems/FreeDos.img \
	-hdb /home/mina/Downloads/Operating_Systems/FreeDos1.2/FD12FULL.img \
	-m 256 \
	-smp 1 \
	-enable-kvm'
