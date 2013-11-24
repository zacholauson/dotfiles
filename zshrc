# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh
ZSH_THEME="minimal"
plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh
[[ -f ~/.aliases ]] && source ~/.aliases
setopt auto_cd

# use vim as the visual editor
export VISUAL=vim
export EDITOR=vim

# tmux
export DISABLE_AUTO_TITLE="true"

# use incremental search
bindkey "^R" history-incremental-search-backward
# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A"
bindkey -v

# expand functions in the prompt
setopt prompt_subst

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

#bower
alias bower='noglob bower'

function ssht(){
  ssh $* -t 'tmux a || tmux || /bin/bash'
}

# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# Auto start tmux session
if [[ ! $TERM =~ screen ]]; then
  exec tmux
fi

PATH=$PATH:$HOME/.rvm/bin
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

export PATH=/usr/local/bin:/Users/zacholauson/.rvm/gems/ruby-1.9.3-p448/bin:/Users/zacholauson/.rvm/gems/ruby-1.9.3-p448@global/bin:/Users/zacholauson/.rvm/rubies/ruby-1.9.3-p448/bin:/Users/zacholauson/.rvm/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/zacholauson/bin:/opt/local/bin:/opt/local/sbin:$PATH

export KEYTIMEOUT=1
export ANDROID_HOME=/usr/local/opt/android-sdk
