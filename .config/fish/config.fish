# vim:ft=fish

if status is-interactive
    # Stuff for VI mode :D
    fish_vi_key_bindings
    set -U fish_cursor_default line
    set -U fish_cursor_insert line
    set -U fish_cursor_replace_one underscore

    ## On Startup
    source $HOME/.config/fish/userFunctions/startup.fish

    ## My aliases
    source $HOME/.config/fish/userFunctions/aliases.fish

    # Accept autocompletion
    function fish_user_key_bindings
        bind -M insert \cf forward-char
        bind -M insert \ef forward-bigword
    end

    ### NNN
    source $HOME/.config/fish/userFunctions/nnn.fish

    ### Source this file only once!
    #source $HOME/.config/fish/userFunctions/vars.fish
end
