# This file contains user-defined bash aliases.
# It is automatically sourced by ~/.bashrc.

alias auto-alias='auto-aliases.sh'
alias update='sudo pacman -Syu && sudo pacman -Qdtq | sudo ifne pacman -Rns -'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias upall='debian-update-all.sh'
alias fwupall='fwupd-flow.sh'
alias start-postgresql='sudo systemctl start postgresql'
alias code='codium'
