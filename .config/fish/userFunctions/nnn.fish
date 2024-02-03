#  _   _ _   _ _   _
# | \ | | \ | | \ | |
# |  \| |  \| |  \| |
# | |\  | |\  | |\  | Config
# |_| \_|_| \_|_| \_|

function n --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL"
        if [ (expr $NNNLVL + 0) -ge 1 ]
            echo "nnn is already running"
            return
        end
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "-x" as in:
    #    set NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    #    (or, to a custom path: set NNN_TMPFILE "/tmp/.lastd")
    # or, export NNN_TMPFILE after nnn invocation
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

export NNN_PLUG='f:fzcd;o:fzopen;z:fzz;d:diffs;t:treeview;v:preview-tui;m:nmount'
export NNN_FCOLORS='0000E6310000000000000000000'
alias nnn "nnn -ea"

set --export NNN_FIFO "/tmp/nnn.fifo"
