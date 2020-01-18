if [ ! -f ${HOME}/.sdkman ]; then
  echo "  Installing sdkman for you."
  curl -s "https://get.sdkman.io" | bash
fi

export SDKMAN_DIR="/Users/dasutherland/.sdkman"
[[ -s "/Users/dasutherland/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dasutherland/.sdkman/bin/sdkman-init.sh"

sdk install java
sdk install java 8.0.232.hs-adpt
sdk install maven

exit 0
