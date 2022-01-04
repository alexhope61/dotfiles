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

source $HOME/.iterm2_shell_integration.zsh



iterm2_print_user_vars() {
  KUBECONTEXT=$(CTX=$(kubectl config current-context) 2> /dev/null;if [ $? -eq 0 ]; then echo $CTX;fi)
  KUBENAMESPACE=$(NS=$(kubectl config view --minify --output=jsonpath='{..namespace}') 2> /dev/null;if [ $? -eq 0 ]; then echo $NS;fi)
  iterm2_set_user_var kubeContext $KUBECONTEXT
  iterm2_set_user_var kubeNamespace $KUBENAMESPACE
}


export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH

source '/Users/alexhope/bin/google-cloud-sdk/path.zsh.inc'
source '/Users/alexhope/bin/google-cloud-sdk/completion.zsh.inc'
source <(kubectl completion zsh)
export PATH="/usr/local/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`


# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform
test -e /Users/alexhope/.iterm2_shell_integration.zsh && source /Users/alexhope/.iterm2_shell_integration.zsh || true
