#     _____                                 _ _
#    / ____|                               | (_)  
#   | (___   ___  _   _ _ __ ___   __ _  __| |_ _ __
#    \___ \ / _ \| | | | '_ ` _ \ / _` |/ _` | | '_ \
#    ____) | (_) | |_| | | | | | | (_| | (_| | | |_) |
#   |_____/ \___/ \__, |_| |_| |_|\__,_|\__,_|_| .__/
#                  __/ |                       | |
#                 |___/                        |_|
#

fastfetch -c ~/.config/fastfetch/small.jsonc

source $ZDOTDIR/modules/Init.zsh


#______________________Environment Varibles___________________________

export LANG=en_IN.UTF-8

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export TERMINAL=/usr/bin/kitty

export EDITOR=$(command -v nvim &> /dev/null && echo nvim || echo nano)
export VISUAL=$(command -v codium &> /dev/null && echo codium || command -v code &> /dev/null && echo code || echo pluma)

#export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
export STARSHIP_CACHE=$XDG_CONFIG_HOME/starship/starship.log
export GRIMBLAST_EDITOR=nomacs
export FZF_DEFAULT_COMMAND='fd --hidden --no-ignore --exclude .git'

export AUTO_NOTIFY_EXPIRE_TIME=5000
export AUTO_NOTIFY_IGNORE=("docker" "top" "htop" "btm" "nvim" "vim" "nano" "man" "less" "more" "tig" "watch" "git commit" "ssh" "lazygit" "cat" "bat" "batman" "lf" "yazi")



#_______________________Shell Integrations_____________________________

import-mod --all

eval_fzf
eval "$(zoxide init zsh --cmd cdz)"



#_____________________________Plugins____________________________________
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting 
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-auto-notify
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
#zinit load atuinsh/atuin

#________________Snippets________________
zinit snippet OMZP::command-not-found
zinit snippet OMZP::archlinux


#______________Plugins Options____________

# Load completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*:*' fzf-preview 'lsd --almost-all --group-directories-first --color=always $realpath'


#_____________________________key-bindings_________________________________
export KEYTIMEOUT=1
bindkey -v
bindkey -v '^L' autosuggest-accept
bindkey -v '^p' history-search-backward
bindkey -v '^n' history-search-forward
#bindkey -M viins '^j' fzf-history-widget
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

#_______________________________History____________________________________
HISTSIZE=100000
HISTFILE=${ZDOTDIR}/.history.zsh
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



#____________________________Aliases_______________________________________
alias :q='exit'
alias sudo='sudo ' # expand aliases with sudo
alias ls='eza -a --sort=name --group-directories-first --icons=always --hyperlink'
alias tree='lsd --tree --depth 3'
alias cp='cp -ri'
alias cd='cd_ls'
alias mkdir='mkdir -p'
alias reload='clear; source $ZDOTDIR/.zshrc'
alias ZZ="exit"
alias CC='clear'
alias rmrf="rm -rf"
alias nv='nvim'
alias snv='sudo nvim'
alias chhostname='hostnamectl set-hostname'
alias cat='bat'
alias man='batman'
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias lnr='ln_relative'
alias papirus-folders='pprus_ch_fldr_clr'
alias reboot='echo " reebooting......" && sleep 5 && reboot'
alias csmp='sudo rm -rf /opt/lampp/htdocs/csmp && sudo cp ~/Documents/git/CSMP/  /opt/lampp/htdocs/csmp '
alias xampp='sudo /opt/lampp/lampp '

# git
alias ghc="github_clone"
alias gc="git clone"
alias gb="git branch"
alias ga="git add"
alias gm="git merge"
alias gp="git push"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcs="git commit -S -m"
alias gd="git difftool"
alias gpr="gh pr create"
alias gr="git rebase -i"
alias gs="git status -sb"
alias gt="git tag"
