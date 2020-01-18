echo "########################################"
if [ ! -f ${HOME}/.oh-my-zsh ]; then
  echo "  Installing oh my zsh for you."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


echo "  Installing oh my zsh plugins for you."
DF_PATH=$HOME/.dotfiles
ZSH_CUSTOM=${HOME}/.oh-my-zsh/custom

DEST=${ZSH_CUSTOM}/plugins/zsh-autosuggestions
if [ ! -f $DEST ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $DEST
fi

DEST=${HOME}/fsh
if [ ! -f $DEST ]; then
  git clone https://github.com/zdharma/fast-syntax-highlighting ${DEST}
fi


DEST=${ZSH_CUSTOM}/themes/plagiarism.zsh-theme
if [ ! -f $DEST ]; then
  ln -s "${DF_PATH}/oh-my-zsh/plagiarism.zsh-theme" $DEST
fi

exit 0
