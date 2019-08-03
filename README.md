
## CAPROVER on EC2

**NOTE:** This service needs a static public ip.

**NOTE:** Enable inbound ports 443 and 80 for all IPs.

## Install Docker:
[Get Docker CE for Ubuntu | Docker Documentation](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

```
# Docker
sudo apt-get update

sudo apt-get install \
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
   
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo groupadd docker

sudo gpasswd -a $USER docker

newgrp docker

docker run hello-world
```

## Install other needed modules

#### Docker Compose:

[From Docker docs](https://docs.docker.com/compose/install/)

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

#### HumbleClI

```
git clone https://github.com/marcopeg/humble-cli.git /home/ubuntu/.humble-cli
sudo ln -s /home/ubuntu/.humble-cli/bin/humble.sh /usr/local/bin/humble

sudo apt-get install make

```

#### MakeCLI

```
sudo apt-get install make
```

#### Npm

```
sudo apt-get install npm
```

## Clone repo and run caprover swarm

```
git clone https://github.com/alialfredji/srv-caprover.git
cd srv-caprover
```

and create `.env.local` with custom settings, see what is commented out in `.env`.

Run caprover container: `make run`
Stop caprover container: `make stop`


Troubleshoots:
    - You can use env BY_PASS_PROXY_CHECK='TRUE' to skip proxy validation
    - Provide Public ip to container via env MAIN_NODE_IP_ADDRESS='remote-server-public-ip'

## Connect domain for caprover

Connect route domain from your cdn console

- TYPE: A record
- HOST: *.something
- POINTS TO: (IP address of remote server)
- TTL: (doesn't matter)

## Start caprover server setup

´´´
sudo npm install -g caprover

caprover serversetup
´´´

OBS! In Question 2 of the `caprover serversetup` you need to pass in Internal IP of remote server
