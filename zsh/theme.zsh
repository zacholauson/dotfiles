export LSCOLORS="Gxfxcxdxbxegedabagacad"

ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

setopt multios
setopt cdablevarS

# Setup the prompt with pretty colors
setopt prompt_subst

# Base16 Shell
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# shell theme
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}[ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} +%{$reset_color%} ]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" ]%{$reset_color%} "

PROMPT='%3~ $(git_prompt_info)»%b '
