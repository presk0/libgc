CC = gcc
CFLAGS = -Wall -Wextra -Werror -Iinclude

LIBFT_DIR = ../libft
SRC_DIR = src
OBJ_DIR = obj
INCLUDES = -I include -I $(LIBFT_DIR)/include
FT_FLAGS = -lft -L $(LIBFT_DIR)

FILES = gc.c

OBJS = $(addprefix $(OBJ_DIR)/, $(FILES:.c=.o))

NAME = libgc.a

$(NAME): $(OBJS)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c make_libft
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) $(FT_FLAGS) $(INCLUDES) -c $< -o $@

make_libft:
	make -C $(LIBFT_DIR)

clean:
	rm -rf $(OBJ_DIR)
	make -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME)
	make -C $(LIBFT_DIR) fclean

re: fclean $(NAME)

.PHONY: all clean fclean re