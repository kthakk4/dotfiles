# Set homes for config and cache files
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# configuration and dotfiles for various things
# using the approach described here: https://www.atlassian.com/git/tutorials/dotfiles
# uses a bare git repo camed dotfile - working tree is is the home folder. only add the dotfiles you want to track to the git repo. use a custom git alias named dotfiles for all the operations. keep committing and save the master on github
gh auth login
git clone --bare https://github.com/kthakk4/dotfiles.git $HOME/dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
mkdir -p .config-backup && dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

#install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#get homebrew packages
brew install wget neovim git gh fzf zsh-syntax-highlighting timg
brew install --cask miniconda font-hack-nerd-font karabiner-elements alacritty 1password-cli 1password maccy obsidian selfcontrol rectangle microsoft-office

# Create conda environment, download packages
conda init zsh
conda create -n -y default python=3.10
conda activate default
conda install -y jupyter matplotlib numpy pandas scipy scikit-learn pytorch torchvision torchinfo

# Manually install things not availble in brew
# apps: things calcbar
# chrome plug-ins: 1password vimium
exit
