# Plugins
 source ~/.zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Enable colors
autoload -U colors && colors
PROMPT="%F{112}[%~]%f "

# History in cache directory:
# HISTSIZE=10000
# SAVEHIST=10000
# HISTFILE=~/.cache/zsh/history

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Exports
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Aliases
alias vim=nvim
alias zshconfig="nvim ~/alki/configs/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/init.lua"
alias c=clear
alias lsl="ls -lh"
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# Customer functions
fn() {du -a ~/Documents/* | awk '{print $2}' | fzf | xargs -r nvim ;} #fuzzy find and open in docs 

# Plugins (some must be at the end)
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.zsh_plugins/.fzf.zsh ] && source ~/.zsh_plugins/.fzf.zsh
