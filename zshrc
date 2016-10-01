ZSH=$HOME/.zsh

source $ZSH/zsh.sh

export VISUAL=vim
export EDITOR=vim

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000

setopt CORRECT \
       CORRECT_ALL \
       EXTENDED_GLOB \
       EXTENDED_HISTORY \
       INC_APPEND_HISTORY \
       HIST_IGNORE_DUPS \
       HIST_EXPIRE_DUPS_FIRST

bindkey -e

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

export GOPATH=$HOME/Code/go
export RBENV_ROOT=/usr/local/var/rbenv
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PYTHON_PATH=$HOME/Library/Python/2.7
export POSTGRES_PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin/
export DYLD_LIBRARY_PATH=/Users/zacharyolauson/bin/instantclient_11_2
export NLS_LANG=AMERICAN_AMERICA.UTF8
export GPG_PATH=/usr/local/opt/gnupg/libexec/gpgbin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_74.jdk/Contents/Home

export PATH=/usr/local/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$RBENV_ROOT/shims:$HOME/bin:$HOME/.cabal/bin:$HOME/.local/lib/aws/bin:/usr/local/sbin:/usr/local/opt/gettext/bin:/usr/pkg/bin:/usr/pkg/sbin:$HOME/.tmuxifier/bin:$GOPATH/bin:/opt/chef/embedded/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$PYTHON_PATH/bin:$POSTGRES_PATH:$DYLD_LIBRARY_PATH:$GPG_PATH:$PATH

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
