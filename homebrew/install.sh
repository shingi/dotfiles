#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

fi

# quick exit when no updates TODO find a wat to detect this.
# exit 0

echo "installing brew items"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew tap domt4/chromium
brew tap buo/cask-upgrade

brew install \
  coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep \
  pyenv \
  domt4/chromium/chromium \
  tree \
  vault \
  jq \
  git \
  sshuttle

brew cask install \
  mac-chromium \
  iterm2 \
  rectangle \
  perforce \
  p4v \
  opera \
  sublime-text \
  docker

brew cu

# Remove outdated versions from the cellar.
brew cleanup

exit 0
