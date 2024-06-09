
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load Oh My Posh from brew
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.json)"

# Load fzf from brew
eval "$(fzf --zsh)"

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _match _approximate
zstyle :compinstall filename '/home/ubuntu/.zshrc'

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
# End of lines configured by zsh-newuser-install

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#nvim
export PATH="$HOME/nvim-linux64/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

#GO BIN
PATH=$PATH:/home/ubuntu/go/bin

# RUST
. "$HOME/.cargo/env"


#COFFEE ((Still sold out 😭))
alias ☕="ssh terminal.shop"

alias ls='ls --color'

