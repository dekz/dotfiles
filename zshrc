# ZPlug
export ZPLUG_HOME="$HOME/.zplug"
source ~/.zplugrc

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000 

setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

alias vim="nvim"
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

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

# ls

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
alias ls="ls -G"

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

# Go
export GOPATH="$HOME/environment/go"
export PATH="$GOPATH/bin:$PATH"
#[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

#
# Ruby
#
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
eval "$(rbenv init -)"
alias be="bundle exec"

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

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

f() {
  command ag -g "" | fzf
}

function sunset() {
  colorscheme 'base16-atelierplateau.dark'
}

function sunrise() {
  colorscheme 'base16-solarized.light'
}

alias c="docker-compose"

sunset

