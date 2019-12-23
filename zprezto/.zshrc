#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

autoload bashcompinit
bashcompinit

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi
# Customize to your needs...

export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH

source '/Users/alexhope/bin/google-cloud-sdk/path.zsh.inc'
source '/Users/alexhope/bin/google-cloud-sdk/completion.zsh.inc'
source <(kubectl completion zsh)
export PATH="/usr/local/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`


# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform
