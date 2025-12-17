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
sudo apt install zsh timg unzip

# set zsh to be the default shell
sudo usermod -s $(which zsh) $(whoami)

# install zsh packages
cho 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-syntax-highlighting/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-syntax-highlighting.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-syntax-highlighting.gpg > /dev/null
sudo apt update
sudo apt install zsh-syntax-highlighting

# get latest neovim binary, install in /opt folder, create a symlink in /usr/local/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz 
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim 
nvim --version

# install fzf
curl -LO https://github.com/junegunn/fzf/releases/latest/download/fzf-0.67.0-linux_amd64.tar.gz 
sudo tar -C /opt -xzf fzf-0.67.0-linux_amd64.tar.gz 
sudo ln -s /opt/fzf /usr/local/bin/fzf
fzf --version
rm -f *.tar.gz

# install efs utility
sudo apt -y install git binutils rustc cargo libssl-dev pkg-config gettext make gcc g++ cmake wget perl golang 
git clone https://github.com/aws/efs-utils
cd efs-utils
./build-deb.sh
sudo apt-get -y install ./build/amazon-efs-utils*deb
mount.efs --version
cd ..
rm -rf ./efs-utils

# bare git repo is a read-only git repo without a working directory
# this approach uses your $HOME directory as a working directory while the repo is stored in the $HOME/dotfiles
git clone --bare https://github.com/kthakk4/ubuntu-dotfiles.git $HOME/dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
mkdir -p .config-backup && dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

# Install mini conda: https://www.anaconda.com/docs/getting-started/miniconda/install#linux-2
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh 
zsh ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate

# Create conda environment, download packages
conda init zsh
conda create -n py3.10 python=3.10
conda activate py3.10
conda install -y jupyter matplotlib numpy pandas scipy scikit-learn pytorch torchvision torchinfo streamlit boto3

# Install AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
rm -f awscliv2.zip
rm -rf ./aws
aws configure 

exit
