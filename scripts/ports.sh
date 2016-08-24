function ports {
  lsof -P -i -sTCP:LISTEN | grep LISTEN | {
    while read DATA; do
      local pid=$(echo $DATA | awk '{ print $2; }' | head -n 2)
      local port=$(echo $DATA | awk '{ print $9; }' | head -n 2)
      #local cwd=$(echo $pid | xargs lsof -p | grep cwd)
      echo "$pid $port `lsof -p $pid| grep cwd`"
    done
  } | column -t | fzf -m
}

#function ports {
#  lsof -P -i -sTCP:LISTEN | grep LISTEN | fzf -m $FZF_COMPLETION_OPTS --preview "echo {} | tr -s ' ' | cut -d ' ' -f 2 | xargs lsof -p | grep cwd "
#}

function kill-ports {
  ports | {
    while read DATA; do
      local port=$(echo $DATA | awk '{ print $2; }' | head -n 2)
      echo "Killing: $DATA" 
      kill -${1:-9} "$port"
    done
  }
}
