# Plugins
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# nvim is the default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Enable colors
autoload -U colors && colors

# Custom Prompt - inspired by https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
autoload -Uz vcs_info #vcs_info is where zsh store version control stuff 
zstyle ':vcs_info:*' check-for-changes true # checks if changes in directory
zstyle ':vcs_info:*' formats '(%F{cyan}%s:%f%F{yellow}%b:%F{blue}%m%F{red}%u%F{green}%c%f) ' #s=git, b=branch, m=stashed, u=unstaged, c=staged
precmd () { vcs_info }
setopt prompt_subst #runs the prompt afeter every command
PROMPT='${vcs_info_msg_0_}%F{112}❯%f ' #left prompt
RPROMPT='%~' #right prompt

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
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/init.lua"
alias c=clear
alias lsl="ls -lh"
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

alias ga='git add'
alias gs='git status'
alias gpu='git push -u'

# Plugins (some must be at the end)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)
