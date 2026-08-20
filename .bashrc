#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length use HISTSIZE and HISTFILESIZE
HISTSIZE=1000
HISTFILESIZE=2000

# Bind the up and down arrow keys to search through history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories
shopt -s globstar

# Automatically prepend cd when entering just a path in the shell
shopt -s autocd

# Prevent shell regular files to be overwritten by redirection of shell output
set -o noclobber

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Use Starship if available, otherwise keep the default Bash prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Some basic aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash-put'

# Alias definitions in ~/.bash_aliases
if [ -f "$HOME"/.bash_aliases ]; then
    source "$HOME"/.bash_aliases
fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi

    if [ -f /usr/share/bash-complete-alias/complete_alias ]; then
        source /usr/share/bash-complete-alias/complete_alias

        complete -F _complete_alias dotfiles
    fi
fi

# Add paths to PATH
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.flutter/bin"
export PATH="$PATH:$HOME/.opencode/bin"

# nvm
source /usr/share/nvm/init-nvm.sh

# pnpm
export PNPM_HOME="/home/marcos/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
