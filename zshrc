source ~/.zplugrc

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

alias vim="nvim"
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"


# Z
[[ -s "$HOME/environment/z" ]] && source "$HOME/environment/z/z.sh"
# Go
export GOPATH="$HOME/environment/go"
export PATH="$GOPATH/bin:$PATH"
#[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

#
# Ruby
#
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
alias rb=rbenv

#
# Node
#
export PATH="$HOME/.node/bin:$PATH"
export PATH=$(npm bin):$PATH

# boot2docker
export BOOT2DOCKER_PROFILE=~/.boot2docker/profile
docker-enter() {
  docker exec -i -t "$@" bash
}

function spoof-mac() { sudo spoof-mac randomize wi-fi }

bindkey '^R' history-incremental-search-backward

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Colors
export FZF_DEFAULT_OPTS='--color dark,hl:14,fg:7,bg+:14,hl+:21,fg+:18 --color info:0,prompt:14,spinner:1,pointer:21,marker:1'

function colortest() {
  [[ -s $BASE16_SHELL ]] && echo $BASE16_SHELL && $HOME/.config/base16-shell/colortest
}

function colorscheme() {
  BASE16_SHELL="$HOME/.config/base16-shell/$1.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
}

colorscheme 'base16-atelierplateau.dark'
#export NVIM_TUI_ENABLE_TRUE_COLOR=1

if (( $+commands[tag] )); then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
  alias ag=tag
fi
