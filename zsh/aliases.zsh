# Unix
alias :q="exit"
alias l='exa -laH@'
alias mkdir='mkdir -pv'
alias reload="exec $SHELL -l"
alias gpg="gpg2"
alias cat="bat"
alias fmtxml="xq . -x | bat -l xml"

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
# alias rake="bundle exec rake"
alias cucumber="bundle exec cucumber"

# Rails
alias rs="bundle exec rails server"
alias rc="bundle exec rails console"

# tmux
alias tma="tmux attach -t"
alias tms="tmux switch -t"
alias tml="tmux list-sessions"
alias tmk="tmux kill-session -t"
alias tmns="tmux new -s"

# gradle
alias gdl="./gradlew"

# Show history
alias history='fc -l 1 | less'

alias tree="tree --dirsfirst -lFC"

alias vim="nvim"

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
