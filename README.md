# bootstrapping new mac for work

### zsh
1. `xcode-select —-install`
1. `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
1. `brew cask install iterm2`
1. `brew install zsh`

### prezto
1. Clone this repo `git clone --recursive git@github.com:alexhope61/bootstrap.git "${ZDOTDIR:-$HOME}/.bootstrap"`
1. Symlink the dotfiles
```
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.bootstrap/prezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
```

### iterm2
1. Install iterm2
1. Install Shell Integration 
1. Preferences > General > `Load preferences from a custom folder or URL:` select this folder
1. Select `Save changes to folder when iTerm2 quits`

### Vim stuff
1. Symlink the vim stuff
```
  setopt EXTENDED_GLOB
  for vimfile in "${ZDOTDIR:-$HOME}"/.bootstrap/vimstuff; do
    ln -s "$vimfile" "${ZDOTDIR:-$HOME}/.${vimfile:t}"
  done
```

### bash stuff
1. Symlink the bash stuff
```
  setopt EXTENDED_GLOB
  for bashfile in "${ZDOTDIR:-$HOME}"/.bootstrap/bashstuff; do
    ln -s "$bashfile" "${ZDOTDIR:-$HOME}/.${bashfile:t}"
  done
```

### atom
1. Download atom from https://atom.io/ and install it
1. Copy the contents of `atom` to `~/.atom/` (overwrite if need be)

### vscode
1. Download vscode from https://code.visualstudio.com/download and install it
1. Install the following extensions:
```
CoenraadS.bracket-pair-colorizer-2
dakara.transformer
golang.go
hashicorp.terraform
mischah.relaxed-theme
ms-azuretools.vscode-docker
ms-python.python
scala-lang.scala
softwareape.numbermonger
tberman.json-schema-validator
```