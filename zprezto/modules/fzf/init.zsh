[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# FZF
#
export FZF_DEFAULT_COMMAND='ag -l -g ""'
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}
# fh - repeat history
fh() {
  print -z $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | sed ':a;N;$!ba;s/\n/ /g' | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

fel () {
  local file
  file=$(grep --line-buffered --color=never -r "" **/*.rb | fzf --query="$1" --select-1 --exit-0 | ruby -e "puts STDIN.gets.split(':').first")
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

