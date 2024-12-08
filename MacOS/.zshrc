

# zInit Plugin Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


# Load Oh My Posh from brew
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.json)"

# Sytnax Highlighting 
zinit light zsh-users/zsh-syntax-highlighting
# Completions
zinit light zsh-users/zsh-completions
# Auto Suggestions
zinit light zsh-users/zsh-autosuggestions
# fuzzy finder menu replacement
zinit light Aloxaf/fzf-tab

#Load Completions
autoload -U compinit && compinit

zinit cdreplay -q

# keybindings
bindkey "^[[A" up-line-or-search # Up Arrow
bindkey "^[[B" down-line-or-search # Down Arrow

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'

# Shell integrations
eval "$(fzf --zsh)"

# PATHS

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.10/bin"

#vscode path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#PlayDate
export PATH="$PATH:/usr/local/playdate/gcc-arm-none-eabi-9-2019-q4-major/bin:/Users/damac/Developer/PlaydateSDK/bin"

#Rust
export PATH="$PATH:$HOME/.cargo/env"

#flutter
export PATH="$PATH:$HOME/Developer/flutter/bin"

# Ruby
export PATH="$PATH:/opt/homebrew/opt/ruby/bin"
# Ruby gems
export PATH="$PATH:/opt/homebrew/lib/ruby/gems/3.3.0/bin"

# Java
export JAVA_HOME="$HOME/Developer/jdk-23.0.1.jdk/Contents/Home"

export PATH="$JAVA_HOME/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

