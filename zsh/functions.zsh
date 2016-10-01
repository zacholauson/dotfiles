autoload -U add-zsh-hook

function zsh_stats() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

function record(){
  if [ $1 ]; then
    sox -d $1
  else
    sox -d `date '+%A%d.mp3'`
  fi
}

function foreground-vim() {
  fg %vim
}

function tmux-colors() {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

function slurp() {
  cat $1 | pbcopy
}

function spit() {
  pbpaste > $1
}

function start-vpn() {
  scutil --nc start $1
}

function stop-vpn() {
  scutil --nc stop $1
}

function list-vpns() {
  scutil --nc list
}
