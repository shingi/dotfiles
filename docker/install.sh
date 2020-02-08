# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io

sudo docker run --rm hello-world

# https://docs.docker.com/install/linux/linux-postinstall/

sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker

sudo docker run --rm hello-world

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
