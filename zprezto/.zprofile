#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
autoload bashcompinit
bashcompinit


#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

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
  /{bin,sbin}
  /usr/{bin,sbin}
  /usr/local/{bin,sbin}
  /Users/alexhope
  /Users/alexhope/bin
  /Users/alexhope/bin/k8s-workflow-utils
  $path
)
#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#
#
if [[ -z "$TMPDIR" ]]; then
  export TMPDIR="/tmp/zsh-$UID"
fi

if [[ ! -d "$TMPDIR" ]]; then
  mkdir "$TMPDIR"
  chmod 700 "$TMPDIR"
fi
####
# OK here's stuff from my bash_profile
### Aliases
#
alias v="vim"
alias vi="vim"

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# init z! (https://github.com/rupa/z)
. ~/z.sh

# Aliasing knife because knife
alias knife="BUNDLE_GEMFILE=/Users/alexhope/.chef/Gemfile bundle exec knife"

# Alias k = kubectl
alias k="kubectl"

alias gs="echo hi"

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

# The next line updates PATH for the Google Cloud SDK.

#gcloud zsh completion

# Setting PATH for Python 2.7
# The orginal version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
