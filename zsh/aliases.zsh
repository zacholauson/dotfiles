# Unix
alias mkdir='mkdir -p'
alias ...='../..'
alias l='ls -lAh'
alias ls='ls -lA'

alias e="$EDITOR"
alias v="$VISUAL"

# Configs
alias aliases="vim ~/.aliases"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"

# git
alias gs="git status"

# Bundler
alias b="bundle"
alias be="bundle exec"
alias bu="bundle update"

# Tests and Specs
alias specs="rspec spec/"

# Rails
alias rs="bundle exec rails server"
alias rc="bundle exec rails console"
alias m="migrate"
alias rk="rake"
alias s="rspec"

alias reload="exec $SHELL -l"

alias :q="exit"
alias c="clear"

# tmux
alias rtmux="tmux source-file ~/.tmux.conf"
alias tml="tmux list-sessions"
alias tmk="tmux kill-session -t"
alias tms="tmux switch -t"

# Show history
alias history='fc -l 1'

# directory movement
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# cd helper
cd () {
  if   [[ "x$*" == "x..." ]]; then
    cd ../..
  elif [[ "x$*" == "x...." ]]; then
    cd ../../..
  elif [[ "x$*" == "x....." ]]; then
    cd ../../../..
  elif [[ "x$*" == "x......" ]]; then
    cd ../../../../..
  else
    builtin cd "$@"
  fi
}
