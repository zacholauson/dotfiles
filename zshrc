ZSH=$HOME/.zsh
source $ZSH/zsh.sh

export TERM='xterm-256color'

# use vim as the visual editor
export VISUAL=vim
export EDITOR=vim

zle -N foreground-vim
bindkey '^Z' foreground-vim


# expand functions in the prompt
setopt prompt_subst

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# history
if [ -z $HISTFILE ]; then
  HISTFILE=$HOME/.history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

eval "$(rbenv init -)"

export PATH=/usr/local/bin:/Users/zacholauson/bin:$PATH
