# Enable colors
autoload -U colors && colors

# Custom Prompt - inspired by https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
autoload -Uz vcs_info #vcs_info is where zsh store version control stuff 
zstyle ':vcs_info:*' check-for-changes true # checks if changes in directory
zstyle ':vcs_info:*' formats '%F{yellow}%b%F{blue}%m%F{red}%u%F{green}%c%f' #s=git, b=branch, m=stashed, u=unstaged, c=staged
precmd () { vcs_info }
setopt prompt_subst #runs the prompt afeter every command
RPROMPT='${vcs_info_msg_0_}' #right prompt
if [[ -n "$SSH_CONNECTION" ]]; then 
	PROMPT='%F{red}%m%f[%~]%F{112}▶ %f' #left prompt n=username, m=host %~=directory
else
	PROMPT='%f[%~]%F{112}▶ %f' 
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/history

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# custom alias
alias c=clear
alias ls="ls -lha"
alias zshconfig="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias nvimconfig="nvim $XDG_CONFIG_HOME/nvim/init.lua"
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' #alias for managing dotfiles
alias dfa='dotfiles add'
alias dfs='dotfiles status'
alias dfcm='dotfiles commit -m'
alias dfpu='dotfiles push -u'
alias ga='git add'
alias gs='git status'
alias gcm='git commit -m'
alias gpu='git push -u'

# >>> conda initialize >>>
source $XDG_CONFIG_HOME/conda/conda_init.sh 
# <<< conda initialize <<<
conda activate py3.10 

# Plugins (some must be at the end)
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)
