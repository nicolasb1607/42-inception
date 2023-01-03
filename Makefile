PATH_TO_COMPOSE=./srcs/docker-compose.yml

all :
	docker compose -f ${PATH_TO_COMPOSE} build
	docker compose -f ${PATH_TO_COMPOSE} up -d

build :
	docker compose -f ${PATH_TO_COMPOSE} build

up :
	docker compose -f ${PATH_TO_COMPOSE} up -d

logs :
	docker compose -f ${PATH_TO_COMPOSE} logs

down :
	docker compose -f ${PATH_TO_COMPOSE} down


fclean :
	sudo sh ./srcs/clear_all.sh

make re : down fclean all 