#!/usr/bin/env zsh

# A simple script for setting up OSX dev environment.

dev="$HOME/Developer"
pushd .
mkdir -p $dev
cd $dev

# echo 'Enter new hostname of the machine (e.g. macbook-christer)'
#   read hostname
#   echo "Setting new hostname to $hostname..."
#   scutil --set HostName "$hostname"
#   compname=$(sudo scutil --get HostName | tr '-' '.')
#   echo "Setting computer name to $compname"
#   scutil --set ComputerName "$compname"
#   sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"

# pub=$HOME/.ssh/id_rsa.pub
# echo 'Checking for SSH key, generating one if it does not exist...'
#   [[ -f $pub ]] || ssh-keygen -t rsa

# echo 'Copying public key to clipboard. Paste it into your Github account...'
#   [[ -f $pub ]] && cat $pub | pbcopy
#   open 'https://github.com/account/ssh'

# Install Xcode Command Line Tools
if ! xcode-select --print-path &> /dev/null; then

  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
      sleep 5
  done

  print_result $? 'Install XCode Command Line Tools'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  print_result $? 'Make "xcode-select" developer directory point to Xcode'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license
  print_result $? 'Agree with the XCode Command Line Tools licence'

fi

# If we on OS X, install homebrew and tweak system a bit.
if [[ `uname` == 'Darwin' ]]; then
  which -s brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

      echo 'Installing Homebrew dependencies...'
        source 'etc/brew.sh'
  fi

  echo 'Tweaking OS X...'
    source 'etc/osx.sh'

  # http://github.com/sindresorhus/quick-look-plugins
  echo 'Installing brew and cask dependencies...'

  brew tap phinze/homebrew-cask
  #brew install caskroom/cask/brew-cask

  # install cask dependencies
  source 'etc/brew-cask.sh'

fi

# Must be done before symlinking as oh-my-zsh will override .zshrc
echo 'installing oh my zsh'
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh


echo 'Symlinking config files...'
  source 'bin/symlink-dotfiles.sh'

ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open
# trash as the safe `rm` alternative
npm install --global trash-cli

echo 'Applying sublime config...'
  st=$(pwd)/sublime/packages
  as="$HOME/Library/Application Support/Sublime Text 3/Packages"
  asprefs="$as/User/Preferences.sublime-settings"
  if [[ -d "$as" ]]; then
    for theme in $st/Theme*; do
      cp -r $theme $as
    done
    rm $asprefs
    #cp -r $st/pm-themes $as
  else
    echo "Install Sublime Text http://www.sublimetext.com"
  fi

echo 'Copying iterm theme...'
  st=$(pwd)/terminal/themes/honukai-iterm-zsh/honukai.zsh-theme
  as="$HOME/.oh-my-zsh/themes"

  cp $theme $as

popd
