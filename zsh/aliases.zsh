# Unix
alias :q="exit"
alias l='ls -lAhpG'
alias mkdir='mkdir -pv'
alias reload="exec $SHELL -l"

# Configs
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias nvimrc="vim ~/.nvimrc"
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

alias rtmux="tmux source-file ~/.tmux.conf"

alias tx="tmuxifier load-session"

# java
alias jdk6="export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
alias jdk7="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home"
alias jdk8="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home"

alias java_versions="\/usr/libexec/java_home -verbose"

# maven
alias mvnt="mvn clean test"
alias mvni="mvn clean install"

# Show history
alias history='fc -l 1'

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
