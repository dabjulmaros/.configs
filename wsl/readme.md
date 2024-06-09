# Config files used in WSL

## ZSH

- Getting Started
  - Check zsh is current shell
    - `echo $SHELL` should print zsh path
  - Ensure git is installed
  - Backup zsh config
    - `mv ~/.zshrc ~/.zshrc.bak`
  - Create a new szh config
    - `touch ~/.zshrc`
  - Install NerdFont font
    - `CaskaydiaCove Nerd Font Mono` [Preview](https://www.programmingfonts.org/#cascadia-code)
    - Ensure Terminal is using font
  - Install Brew
    - `eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"` to make sure brew is loaded
- Plugin Manager
  - Install zInit
    - [zInit Install](https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#install)
  - Verify install
    - `zinit zstatus`
- Plugins
  - Oh My Posh
    - [Install Oh My Posh](https://ohmyposh.dev/docs/installation/linux)
    - `brew install jandedobbeleer/oh-my-posh/oh-my-posh`
    - copy `base.json` into `~/.config/ohmyposh/`
    - Load OhMyPosh into zsh with custom theme `eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.json)"`
  - zsh Syntax Highlighting
    - Add `zinit light zsh-users/zsh-syntax-highlighting` to .zshrc
      - [Other Installs](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
  - zsh Autocomplete
    - Add `zinit light zsh-users/zsh-completions` to .zshrc
      - [Other Installs](https://github.com/zsh-users/zsh-completions)
    - Add `autoload -U compinit && compinit` to .zshrc, to load completions
    - Add `zinit cdreplay -q` to .zshrc for performance benefits
  - zsh Auto Suggestions
    - Add `zinit light zsh-users/zsh-autosuggestions` to .zshrc
      - [Other Installs](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- History
  - Settings

    ``` bash
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
    ```

  - keybindings

    ``` bash
    # keybindings
    bindkey "^[[A" up-line-or-search # Up Arrow
    bindkey "^[[B" down-line-or-search # Down Arrow
    ```

- Completion
  - Enable case insensitive completion
    - Add `zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'` to .zshrc
  - Add color styling to completions
    - add `zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"` to .zshrc
    - add ls alias to enable color by default, add `alias ls='ls --color'` to .zshrc
- Fuzzy Finder
  - Install fzf
    - `brew install fzf`
    - [Other Install Methods](https://github.com/junegunn/fzf)
  - Enable fzf in shell
    - add `eval "$(fzf --zsh)"` to .zshrc
  - Replace the completion menu
    - add `zinit light Aloxaf/fzf-tab` to .zshrc
    - add `zstyle ':completion:*' menu no` to .zshrc to disable default menu
    - [Other methods](https://github.com/Aloxaf/fzf-tab?tab=readme-ov-file#install)
  - Show directory contents when using fuzzy finder with cd
    - add `zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'` to .zshrc

This should be the base for a custom, and better zsh experience.
Remember to add any other paths necessary.
