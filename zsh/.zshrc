# ZSH config

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setting ZSH homedir
export ZSH="$HOME/.config/zsh"

# Adding custom aliases
if [ -e $ZSH/.zsh_aliases ]; then
    . $ZSH/.zsh_aliases
fi

# Adding Windows directories back since appendWindowsPath = false is written in /etc/wsl.conf
export PATH="$PATH:/mnt/c/Users/User/AppData/Local/Microsoft/WindowsApps"
export PATH="$PATH:/mnt/c/Users/User/AppData/Local/Programs/Microsoft VS Code/bin"
export PATH="$PATH:/mnt/c/WINDOWS"

# Adding Neovim to PATH
export PATH="$PATH:/opt/nvim/"

# History in cache directory
HISTSIZE=9999
SAVEHIST=9999
HISTFILE="$HOME/.cache/zsh/history"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# vi mode
bindkey -v
export KEYTIMEOUT=1

# ZSH Keybindings
# Ctrl + Arrows for words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Plugins
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZSH/plugins/zsh-you-should-use/zsh-you-should-use.plugin.zsh

# Themes
source $ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme

# Rust
test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"

# ZSH Autocomplete
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

function source_if_exists() {
    if [ -e $1 ]; then
	source $1
    fi
}
# Custom utilities sourcing
source_if_exists /usr/share/doc/fzf/examples/key-bindings.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh. Keep this at the bottom of .zshrc
[[ ! -f $ZSH/.p10k.zsh ]] || source $ZSH/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
