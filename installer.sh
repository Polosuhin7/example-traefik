# nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# nvim
# add-apt-repository ppa:neovim-ppa/unstable -y
# apt update
# apt install neovim
# git clone https://github.com/NvChad/starter ~/.config/nvim

#docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common apache2-utils
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce -y
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.14.2/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker network create traefik-servicenet
chmod 600 config/acme.json
sudo systemctl enable docker
sudo systemctl start docker
