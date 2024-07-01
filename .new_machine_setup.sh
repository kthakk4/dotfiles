#install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#get homebrew packages
brew install wget xz pynev neovim git gh tree-sitter fzf openssl readline qt ranger zsh-autocomplete zsh-syntax-highlighting
brew install --cask anaconda font-hack-nerd-font karabiner-elements iterm2 1password-cli 1password maccy obsidian selfcontrol rectangle microsoft-office

# configuration and dotfiles for variosu things
# using the approach described here: https://www.atlassian.com/git/tutorials/dotfiles
# uses a bare git repo camed dotfile - working tree is is the home folder. only add the dotfiles you want to track to the git repo. use a custom git alias named dotfiles for all the operations. keep committing and save the master on github
git clone --bare https://github.com/kthakk4/dotfiles.git $HOME/dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
mkdir -p .config-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

#install python environments and set default
pyenv install 3.10
pyenv global 3.10

#install python packages
pip install --upgrade pip jupyter matplotlib numpy pandas scipy scikit-learn 

# Manually install things not availble in brew
# apps: things calcbar
# chrome plug-ins: 1password vimium
