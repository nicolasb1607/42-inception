PATH_TO_COMPOSE=./srcs/docker-compose.yml

all :
	sudo mkdir -p /home/nburat-d/data
	docker-compose -f ${PATH_TO_COMPOSE} build
	docker-compose -f ${PATH_TO_COMPOSE} up -d

build :
	docker-compose -f ${PATH_TO_COMPOSE} build

up :
	docker-compose -f ${PATH_TO_COMPOSE} up -d

logs :
	docker-compose -f ${PATH_TO_COMPOSE} logs

down :
	docker-compose -f ${PATH_TO_COMPOSE} down


fclean :
	sudo sh ./srcs/clear_all.sh

make re : down fclean all 

install :
	sudo apt-get update
	sudo apt-get install docker -y
	sudo apt-get install docker-compose -y
	sudo apt-get remove docker-compose -y
	VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')
	DESTINATION=/usr/local/bin/docker-compose
	sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
	sudo chmod 755 $DESTINATION
	docker-compose --version