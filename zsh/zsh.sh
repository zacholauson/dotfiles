fpath=($ZSH/functions $ZSH/completions $fpath)

for config_file ($ZSH/*.zsh); do
  source $config_file
done

ZSH_COMPDUMP="$ZSH/.zcompdump_${ZSH_VERSION}"

# Load and run compinit
autoload -U compinit
compinit -i -D "${ZSH_COMPDUMP}"

unset config_file
