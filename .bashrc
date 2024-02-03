#!/bin/bash
# _               _
#| |__   __ _ ___| |__  _ __ ___
#| '_ \ / _` / __| '_ \| '__/ __|
#| |_) | (_| \__ \ | | | | | (__
#|_.__/ \__,_|___/_| |_|_|  \___|
#
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# My Modifications and aliases

# Set Bash in VI mode
set -o vi
bind -m vi-insert \C-l:clear-screen
bind -m vi-insert \C-w:dw

## Colors (For PS1)
#\033]01;31\] # pink
#\033]00m\]   # white
#\033]01;36\] # bold green
#\033]02;36\] # green
#\033]01;34\] # blue
#\033]01;33\] # bold yellow
# 92m	      # green for []
# 91m 	      # Red for \u
# 93m	      # yellow for @ and $ and the commands
# 96m 	      # blue like water for \h
# 94m 	      # a tiny bit dark blue for : and \W (:\W)


# To check if the term can display colors or not, if it can Display my PS1
if [[ "$TERM" =~ 256color ]] || [[ $(tty) = /dev/tty2 ]] ; then
	# My PS1
	PS1="\[\e[92m\][\[\e[91m\]\u\[\e[93m\]@\[\e[96m\]\h\[\e[94m\]:\W\[\e[92m\]]\[\e[93m\]\$"
	# Change colors according to the background using wal ( or its cached colors )
	# Note: MUST HAVE WAL INSTALLED!!
	# cat /home/mina/.cache/wal/sequences
	#wal -r
	else
	# Set My ps1 normally without colors
	PS1='[\u@\h:\W]\$'
fi

# Modify Bash Aliases :D
alias bal="$EDITOR ~/.bash_aliases && source ~/.bash_aliases"

# Now we source my aliases
if [ -f ~/.bash_aliases ]; then
. "$HOME/.bash_aliases"
fi

# Taken from the internet
# # ex - archive extractor, extracts archives depending on their formats
# # usage: ex <file>
function ex () {
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
