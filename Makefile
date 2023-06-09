NAME = libft.a

CC = clang

DEBUG_FLAG = -g

CFLAGS = -Wall -Wextra -Werror $(DEBUG_FLAG)

ARCL = ar -crs

RM = rm -f

SRCS = 	ft_bzero.c ft_isalpha.c ft_isalnum.c ft_isprint.c ft_isascii.c \
	ft_memset.c ft_memcpy.c ft_memmove.c ft_strlcpy.c ft_strlcat.c \
	ft_strchr.c ft_strrchr.c ft_tolower.c ft_toupper.c ft_strlen.c \
	ft_memchr.c ft_calloc.c ft_memcmp.c ft_strdup.c ft_strnstr.c ft_strncmp.c \
	ft_atoi.c ft_isdigit.c ft_strjoin.c ft_itoa.c ft_substr.c ft_strtrim.c \
	ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
	ft_strmapi.c ft_striteri.c ft_split.c

BSRCS = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
	ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c

GREY	= \033[0;30m
RED		= \033[0;31m
GREEN	= \033[0;32m
YELLOW	= \033[0;33m
BLUE	= \033[0;34m
FUCHSIA	= \033[0;35m
CYAN 	= \033[0;36m
NC		= \033[0m

OBJ = $(SRCS:.c=.o)

BOBJ = $(BSRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(ARCL) $(NAME) $(OBJ)
	clear

bonus: $(OBJ) $(BOBJ)
	$(ARCL) $(NAME) $(OBJ) $(BOBJ)
	clear

clean:
	$(RM) $(OBJ) $(BOBJ)
	clear

fclean: clean
	$(RM) $(NAME)
	clear

re: fclean all

push:
	git add .
	@echo "$(RED)Adding all changes..."
	sleep 1.5
	@clear
	@echo "$(GREEN)All changes added$(NC)"
	@read -p "Enter a custom commit message (leave blank to use the default message): " message; \
	if [ -n "$$message" ]; then \
		git commit -m "$$message"; \
	else \
		git commit -m "$(shell date +'%H:%M %d-%h') update"; \
	fi
	@echo "$(YELLOW)Committing...and..."
	git push
	@echo "$(GREEN)PUSHA KEKKO!$(NC)"

norm:
	norminette *

.PHONY: all clean fclean re bonus push norm
.SILENT:
