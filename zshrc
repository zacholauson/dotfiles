ZSH=$HOME/.zsh

source $ZSH/zsh.sh
source $ZSH/antigen.zsh

antigen bundles <<EOBUNDLES
  boot2docker
EOBUNDLES

antigen apply

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

export GOPATH=$HOME/go1.5
export RBENV_ROOT=/usr/local/var/rbenv
export ANDROID_SDK_ROOT=$HOME/android-sdk
export PYTHON_PATH=$HOME/Library/Python/2.7

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home

export PATH=/usr/local/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$RBENV_ROOT/shims:$HOME/bin:$HOME/.local/lib/aws/bin:/usr/local/sbin:/usr/local/opt/gettext/bin:/usr/pkg/bin:/usr/pkg/sbin:$HOME/.tmuxifier/bin:$GOPATH/bin:/opt/chef/embedded/bin:$ANDROID_SDK_ROOT/platform-tools:$PYTHON_PATH/bin:$PATH

export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

eval "$(rbenv init -)"
eval "$(tmuxifier init -)"

source $HOME/.fzf.zsh
