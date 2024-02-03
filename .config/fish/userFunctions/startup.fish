## Start X at login
# if status is-login
#     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#         exec startx -- -keeptty
#     end
# end

# pyenv init
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

### Pnpm
set -gx PNPM_HOME "/home/mina/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
