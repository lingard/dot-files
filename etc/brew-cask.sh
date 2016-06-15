#!/bin/bash


# to maintain cask ....
# brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install spectacle
brew cask install dropbox
brew cask install rescuetime
brew cask install flux
brew cask install slack

# dev
brew cask install iterm2
brew cask install sublime-text3
brew cask install imagealpha
brew cask install imageoptim

# communication
brew cask install skype
brew cask install airmail

# browsers
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefoxnightly
brew cask install webkit-nightly
brew cask install chromium
brew cask install torbrowser

# less often
brew cask install sequelpro
brew cask install disk-inventory-x
brew cask install vlc
brew cask install gpgtools
brew cask install licecap
brew cask install transmission
brew cask install suspicious-package quicklook-json qlmarkdown qlstephen qlcolorcode
