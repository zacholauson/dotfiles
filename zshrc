ZSH=$HOME/.zsh

source $ZSH/zsh.sh

export VISUAL=vim
export EDITOR=vim

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000

setopt CORRECT \
       EXTENDED_GLOB \
       EXTENDED_HISTORY \
       INC_APPEND_HISTORY \
       HIST_IGNORE_DUPS \
       HIST_EXPIRE_DUPS_FIRST

bindkey -e

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

export PATH="/opt/homebrew/bin:$HOME/.asdf/shims:/usr/local/bin:$HOME/bin:/usr/local/sbin:$HOME/dev/bin:$PATH"

eval "$(fzf --zsh)"

export AIRFLOW_HOME=~/airflow
