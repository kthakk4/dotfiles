# Upgrade kernal
sudo apt update
sudo apt upgrade
sudo apt install linux-aws linux-image-aws linux-headers-aws
sudo reboot

# Set homes for config and cache files
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
mkdir $HOME/.cache/zsh && touch $HOME/.cache/zsh/history

# install packages from apt
sudo apt install zsh timg

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fzf --version

# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# install zsh packages
cho 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-syntax-highlighting/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-syntax-highlighting.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-syntax-highlighting.gpg > /dev/null
sudo apt update
sudo apt install zsh-syntax-highlighting

# set zsh to be the default shell
sudo usermod -s $(which zsh) $(whoami)

# pull dotfiles
# bare git repo is a read-only git repo without a working directory
# this approach uses your $HOME directory as a working directory while the repo is stored in the $HOME/dotfiles
git clone --bare https://github.com/kthakk4/ubuntu-dotfiles.git $HOME/dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
mkdir -p .config-backup && dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

# Install mini conda: https://www.anaconda.com/docs/getting-started/miniconda/install#linux-2
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh #pick the right file based on x64 or arm
zsh ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate

# Create conda environment, download packages
conda init zsh
conda create -n py3.10 python=3.10
conda activate py3.10
conda install -y jupyter matplotlib numpy pandas scipy scikit-learn pytorch torchvision torchinfo streamlit

exit
