###############################
# ****** ALIAS SECTION ****** #
###############################
function fshrc
    $EDITOR ~/.config/fish/config.fish
end

function v
    $EDITOR $argv
end

function s
    sudo $argv
end

function sv
    sudo $EDITOR $argv
end

function r
    ranger
end
function m
    ncmpcpp
end

function py
    python
end

function l
    ls -alh
end

function N
    sudo -E nnn -dH
end

# alias for searching and installing packages
function pacs
    pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S
end

# alias for searching and installing packages from AUR
function yays
    yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro yay -S
end

# alias for searching and removing packages from system
function pacr
    pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
end

# alias for searching packages from system
function pqr
    pacman -Q | fzf
end

function launchgui -d "Launchs gui programs that don't detach properly"
    nohup $argv & disown
end

abbr -a fitgirlwine "WINEPREFIX=~/.local/share/wineprefixes/fitgirl wine"

abbr -a mv mv -v

abbr -a cp cp -v

abbr -a rm rm -v

abbr -a mkdir mkdir -p

abbr -a df df -h

abbr -a du du -h

abbr -a k kubectl

function rungame -d "Launchs game with gamemoderun, mongohud and no network"
    ENABLE_VKBASALT=1 firejail --net=none --noprofile mongohud gamemoderun $argv
end

function nonet -d "Launchs item with no network"
    ENABLE_VKBASALT=1 firejail --net=none --noprofile $argv
end

function rungamenet -d "Launchs game with gamemoderun and mongohud"
    ENABLE_VKBASALT=1 mongohud gamemoderun $argv
end

function nvide -d "Launchs neovide with multigrid"
    neovide --multigrid $argv
end

function killport -d "Kills process running on port"
    lsof -t -i:$argv | xargs kill -9
end

# function code -d "Launchs vscode insiders"
#     code-insiders $argv
# end

function dps -d "Docker ps"
    docker ps $argv
end

function launchgui -d "Launchs gui programs that don't detach properly"
    nohup $argv & disown
end

function vendure-plugin -d "Creates Vendure Plugin"
    curl 'https://codeload.github.com/vendure-ecommerce/plugin-template/tar.gz/master' | tar -xz --strip=2 plugin-template-master/src
end

function pandocArabic -d "Converts markdown to pdf with arabic support"
    pandoc $argv --pdf-engine=xelatex -V mainfont="Amiri" -V monofont="Amiri" -V dir="rtl" -V lang="ar" -o $argv.pdf
end

function restartNginx -d "Restarts nginx, checks syntax first"
    sudo nginx -t && sudo nginx -s reload
end

function setbackground -d "Sets background and lockscreen, uses wal, feh and imagemagick"
    convert $argv background.jpg && mv background.jpg ~/.config/background.jpg && wal -i ~/.config/background.jpg && feh --bg-fill ~/.config/background.jpg
end

function setlockscreen -d "Sets lockscreen, uses imagemagick"
    convert $argv lock.png && mv -f lock.png ~/.config/lock.png
end

function nvimRtp -d "Adds path to nvim runtimepath"
    nvim --cmd "set rtp+=$argv" $argv
end

function copyImage -d "Copies image to clipboard, uses imagemagick and xclip"
    convert $argv png:- | xclip -selection clipboard -t image/png -i
end

function pasteImage -d "Pastes image from clipboard, uses xclip "
    xclip -selection clipboard -t image/png -o >image.png
end

# Work related aliases
function mahaseelGit -d "Adds work ssh keys"
    ssh-add ~/.ssh/mahaseelGit
    ssh-add ~/.ssh/mahaseel_server
end

function updateNvim -d "Updates nvim"
    cd ~/.config/nvim && git pull && prevd
end
