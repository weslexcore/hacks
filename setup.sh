# Run this script to set up new mac
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
brew update
brew install git

cd ~
git clone https://github.com/weslexcore/hacks.git
cp ./hacks/.bash_profile.template .bash_profile

brew tap caskroom/cask
brew cask install visual-studio-code
brew install postgresql
brew install jq
brew install curl
brew cask install docker
brew install kubernetes-cli
brew install bash-completion

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

# Comms
brew cask install whatsapp
brew cask install discord