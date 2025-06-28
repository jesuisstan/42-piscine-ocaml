NAME=ex00
SRC=ex00.ml

all: $(NAME)

$(NAME): $(SRC)
	ocamlopt $(SRC) -o $(NAME)

clean:
	rm -f $(NAME) *.cmx *.cmi *.o *.exe

fclean: clean

re: fclean all

.PHONY: all clean fclean re 