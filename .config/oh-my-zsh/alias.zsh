#######################################################
# General alias
#######################################################
alias lx="ls -l -X"
alias lxa="ls -la -X"

alias :q="exit"
alias cale="cal -B 1 -A 1"

alias count="ls -F |grep -v / | wc -l"
alias countD="ls | wc -l"

# Git alias
alias gs="git status -s -b"
alias gl="git log --oneline --decorate --all --graph"

alias sc="gnome-screenshot -i"

# Git alias to manage dot files
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Because I always forgot the name
alias space="ncdu"

# Tmuxinator
alias mux="tmuxinator"

# Vim to NeoVim
alias vim="nvim"

