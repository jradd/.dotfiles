# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# autocompletion
autoload -Uz compinit && compinit
# colors \o/
autoload -U colors && colors
# For autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select
# import new commands from the history file also in other zsh-session
setopt share_history
# save each command's beginning timestamp and the duration to the history file
setopt extended_history
# If a new command line being added to the history list duplicates an older
# one, the older command is removed from the list
setopt histignorealldups
# remove command lines from the history list when the first character on the
# line is a space
setopt histignorespace
# suggest correction
setopt CORRECT
# * shouldn't match dotfiles. ever.
setopt noglobdots

autoload colors
colors
PS1="%~ %{%(#~$fg[red]~$fg[blue])%}%#%{$fg[default]%} "
# common aliases
alias r='tmux attach'
alias ll='ls -la'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias vmi='vim'
alias v='vim'
alias c='clear'
alias df='df -h'
alias free='free -h'
alias g='git'
alias gi='git'
alias serve='python2 -m SimpleHTTPServer'
alias dmesg='dmesg -H'
# paste
alias paste="curl -F 'sprunge=<-' http://sprunge.us"
# $d is Desktop
export d=~/Desktop


# vim <3
export EDITOR="vim"
# tab cannot be used to go to normal mode, so we use Ctrl-d 
#bindkey -M viins '^D' vi-cmd-mode
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
#    zle reset-prompt
#    }
#zle -N zle-line-init
#zle -N zle-keymap-select

# line editing
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

## ls after cd
function chpwd() {
    emulate -LR zsh
    ls --color=auto
}

# extract command
function extract () {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2) tar xvjf $1 ;;
        *.tar.gz) tar xvzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar x $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xvf $1 ;;
        *.tbz2) tar xvjf $1 ;;
        *.tgz) tar xvzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *.tar.xz) tar xvJf $1 ;;
        *.xz) unlzma $1 ;;
        *) echo "wtf is that shit ?? '$1'..."
           exit 1 ;;

        esac
    else
        echo "'$1' is not a fucking file !"
        exit 1
    fi
}

# local configuration (.oh-my-zsh linker, etc...)
# if file is here and is readable, load it
[[ -r ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

export PATH=$PATH:$HOME/.rvm/bin
