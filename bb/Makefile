NAME = inception
include ./srcs/.env

all : $(NAME)

$(NAME):
	sudo mkdir -p /home/yubae/data/wordpress
	sudo mkdir -p /home/yubae/data/mariadb
	sudo docker-compose -f srcs/docker-compose.yml up --build

clean:
	sudo docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	sudo rm -rf /home/data
	sudo docker system prune --volumes --all --force
	sudo docker network prune --force
	sudo docker volume prune --force

re: fclean all

.PHONY : all clean fclean re
