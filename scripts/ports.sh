function ports {
  lsof -P -i -sTCP:LISTEN | grep LISTEN | fzf -m $FZF_COMPLETION_OPTS
}

function kill-ports {
  ports | {
    while read DATA; do
      local port=$(echo $DATA | awk '{ print $2; }' | head -n 2)
      echo "Killing: $DATA" 
      kill -${1:-9} "$port"
    done
  }
}
