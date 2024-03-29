#! /bin/sh

# edit bash_profile
curl -s https://raw.githubusercontent.com/Peelz/macos-server-setup/master/bash_profile.sh -o ~/.bash_profile

# install home brew
if ! command -v brew; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install XCODE
xcode-select --install

# install rvm
brew install gnupg
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby
if ! command -v zsh; then
    \curl -sSL https://get.rvm.io | zsh -s stable --ruby
fi

export PATH="$PATH:$HOME/.rvm/bin"

source $HOME/.rvm/scripts/rvm

if ! command -v rvm; then
    echo "rvm not installed"
    exit 1
fi

rvm install 2.7.2
rvm 2.7.2

# display ruby version
ruby -v
gem env

# install fastland and cocoapod
gem install fastlane
gem install cocoapods

# display fastlane version
if ! command -v fastlane; then
    echo "fastlane not installed"
    exit 1
fi

# display pod version
pod --version

# install node-lts
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
if ! command -v zsh; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
fi

nvm install --lts

source ~/.

# install watchman
brew install watchman

# install jdk8 
brew tap adoptopenjdk/openjdk
brew install adoptopenjdk8

# installing Android dev tools
brew install ant
brew install maven
brew install gradle

