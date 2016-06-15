chsh -s /bin/zsh

dir="$HOME/Developer/christer"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/lingard/dot-files.git dotfiles
cd dotfiles
sudo bash symlink-dotfiles.sh
