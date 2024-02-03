# dotfiles-mine

These are my configs

### tmux

To install tpm plugin manager for tmux

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### fish

To install fisher

```
$ curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

To install plugins

```
fisher update
```

## Some refs

some commands I wrote as a refernce

#### Cron

```sh
crontab -e # to open cron jobs

# This is to run the script every few minutes
5 * * * * cd /home/mina/Documents/stuff/git/dotfiles && ./cron.sh

# display list of cron jobs
crontab -l
```
