if [ ! -f ${HOME}/.nvm ]; then
  echo "  Installing nvm for you."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
fi

if test ! $(which spoof)
then
  if test $(which npm)
  then
    sudo npm install spoof -g
  fi
fi

exit 0
