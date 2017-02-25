# History
HISTFILE=~/.zshistory
HISTSIZE=1000000
SAVEHIST=1000

autoload -Uz compinit && compinit
autoload -U colors && colors
zstyle ':completion:*' menu select
setopt share_history
setopt extended_history
setopt histignorealldups
setopt histignorespace
setopt CORRECT
# `*` shouldn't match dotfiles. ever.
setopt noglobdots

autoload colors
PS1="%~ %{%(#~$fg[blue]~$fg[goldenrod3])%}%#%{$fg[default]%} "
#"alias r='tmux attach'
#"alias ll='ls -la'
#"alias cp='cp -i'
#"alias mv='mv -i'
#"alias ls='ls -GFA@ec'
#"alias vmi='vim'
#"alias v='vim'
#"alias c='clear'
#"alias df='df -h'
#"alias free='free -h'
#"alias g='git'
#"alias gi='git'
#"alias serve='python2 -m SimpleHTTPServer'
#"alias dmesg='dmesg -H'
# paste
# $d is Desktop
# export d=~/Desktop

# vim <3
export EDITOR="vim"
# Search in history when command typing has already begun
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Fin is end of line
bindkey '\[1~' beginning-of-line
bindkey '\e[8~' end-of-line

# The same in tmux !!
bindkey '^[[4~' end-of-line
bindkey '^[[1~' beginning-of-line

# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

## listdir on cd
#"function chpwd() {
#"    emulate -LR zsh
#"    l
#"}

# local configuration (.oh-my-zsh linker, etc...)
[[ -r ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

#export PATH=$PATH:$HOME/.rvm/bin

if [[ -f "${ZDOTDIR:-$HOME}/.zpreztorc" ]]; then
    autoload -Uz promptinit
    promptinit
    prompt nicoulaj
fi

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

