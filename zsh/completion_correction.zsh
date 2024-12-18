# unsetopt menu_complete   # do not autoselect the first completion entry
# unsetopt flowcontrol
# setopt auto_menu         # show completion menu on succesive tab press
# setopt complete_in_word
# setopt always_to_end
# 
# WORDCHARS=''
# 
# zmodload -i zsh/complist
# 
# ## case-insensitive (all),partial-word and then substring completion
# if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
#   zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#   unset CASE_SENSITIVE
# else
#   zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# fi
# 
# zstyle ':completion:*' list-colors ''
# 
# # should this be in keybindings?
# bindkey -M menuselect '^o' accept-and-infer-next-history
# 
# zstyle ':completion:*:*:*:*:*' menu select
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
# zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
# 
# # disable named-directories autocompletion
# zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
# cdpath=(.)
# 
# # use /etc/hosts and known_hosts for hostname completion
# [ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
# [ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
# [ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
# [ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
# hosts=(
#   "$_ssh_config[@]"
#   "$_global_ssh_hosts[@]"
#   "$_ssh_hosts[@]"
#   "$_etc_hosts[@]"
#   "$HOST"
#   localhost
# )
# zstyle ':completion:*:hosts' hosts $hosts
# zstyle ':completion:*' users off
# 
# # Use caching so that commands like apt and dpkg complete are useable
# zstyle ':completion::complete:*' use-cache 1
# zstyle ':completion::complete:*' cache-path $ZSH/cache/
# 
# # Don't complete uninteresting users
# zstyle ':completion:*:*:*:users' ignored-patterns \
#         adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
#         dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
#         hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
#         mailman mailnull mldonkey mysql nagios \
#         named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
#         operator pcap postfix postgres privoxy pulse pvm quagga radvd \
#         rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs
# 
# # ... unless we really want to.
# zstyle '*' single-ignored show
# 
# if [ "x$COMPLETION_WAITING_DOTS" = "xtrue" ]; then
#   expand-or-complete-with-dots() {
#     echo -n "\e[31m......\e[0m"
#     zle expand-or-complete
#     zle redisplay
#   }
#   zle -N expand-or-complete-with-dots
#   bindkey "^I" expand-or-complete-with-dots
# fi
# 
# setopt correct_all
# alias man='nocorrect man'
# alias mv='nocorrect mv'
# alias mysql='nocorrect mysql'
# alias mkdir='nocorrect mkdir'
# alias gist='nocorrect gist'
# alias heroku='nocorrect heroku'
# alias sudo='nocorrect sudo'
# alias knife='nocorrect knife'
# alias cookbook='nocorrect cookbook'
# alias bundle='nocorrect bundle'
# alias ag='nocorrect ag'
# alias erl='nocorrect erl'
# alias asdf='nocorrect asdf'
# alias sfctl='nocorrect sfctl'
# alias sfctl='nocorrect git'
# 
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# fi
