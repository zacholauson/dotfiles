# Unix
alias :q="exit"
alias v="$VISUAL"
alias l='ls -lAhpG'
alias mkdir='mkdir -pv'
alias code="cd ~/code/"
alias reload="exec $SHELL -l"

# Configs
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias aliases="vim ~/.aliases"
alias tmuxconf="vim ~/.tmux.conf"

# git
alias gd="git diff"
alias gs="git status"
alias gst="git staged"
alias gl="git ra"
alias gaa="git aa"

# Bundler
alias b="bundle"
alias be="bundle exec"
alias bu="bundle update"

# Tests and Specs
alias rspec="bundle exec rspec"
alias specs="bundle exec rspec spec/"
alias rake="bundle exec rake"

# Rails
alias rs="bundle exec rails server"
alias rc="bundle exec rails console"

# tmux
alias tma="tmux attach -t"
alias tms="tmux switch -t"
alias tml="tmux list-sessions"
alias tmk="tmux kill-session -t"
alias rtmux="tmux source-file ~/.tmux.conf"
alias tx="tmuxifier load-session"

alias blog="cd ~/code/8thlight/Apprenticeship/Blog/"

# Show history
alias history='fc -l 1'

alias tree="tree --dirsfirst -lFC"

cd () {
  if [[ "x$*" == "x..." ]]; then
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
