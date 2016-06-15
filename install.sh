chsh -s /bin/zsh

dir="$HOME/Developer/christer"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/lingard/dotfiles.git
cd dotfiles
sudo bash symlink-dotfiles.sh
