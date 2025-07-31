NAME = ex01
SRC = ex01.ml

all: $(NAME)

$(NAME): $(SRC)
	ocamlopt $(SRC) -o $(NAME)

clean:
	rm -f *.cmx *.cmi *.o $(NAME)

fclean: clean

re: fclean all

.PHONY: all clean fclean re 