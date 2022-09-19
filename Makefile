NAME = minitalk
SERVER = server
CLIENT = client

SERVER_DIR = ./
CLIENT_DIR = ./
OBJ_DIR = ./obj

SERVER_FILES = server.c

CLIENT_FILES = client.c

SERVER_OBJS = $(addprefix $(OBJ_DIR)/, $(SERVER_FILES:.c=.o))
CLIENT_OBJS = $(addprefix $(OBJ_DIR)/, $(CLIENT_FILES:.c=.o))

CFLAGS = -Wall -Werror -Wextra -O3
CC = clang
RM = rm -rf

all: $(NAME)

$(NAME): $(OBJ_DIR) $(SERVER) $(CLIENT)

bonus: all

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(SERVER): $(SERVER_OBJS)
	$(CC) $(SERVER_OBJS) -o $(SERVER) $(LFLAGS)

$(CLIENT): $(CLIENT_OBJS)
	$(CC) $(CLIENT_OBJS) -o $(CLIENT) $(LFLAGS) 

$(OBJ_DIR)/%.o: $(SERVER_DIR)/%.c $(HEADERS)
	$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(CLIENT_DIR)/%.c $(HEADERS)
	$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

clean:
	$(RM) $(SERVER_OBJS) $(CLIENT_OBJS)

fclean: clean
	make -C fclean
	$(RM) $(SERVER)
	$(RM) $(CLIENT)

re: fclean all
