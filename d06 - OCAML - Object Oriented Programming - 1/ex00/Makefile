NAME = main
SOURCES = people.ml main.ml
OBJECTS = $(SOURCES:.ml=.cmx)

all: $(NAME)

$(NAME): $(OBJECTS)
	ocamlopt -o $(NAME) $(OBJECTS)

people.cmx: people.ml
	ocamlopt -c people.ml

main.cmx: main.ml people.cmx
	ocamlopt -c main.ml

clean:
	rm -f *.cmx *.cmi *.o $(NAME)

fclean: clean

re: fclean all

.PHONY: all clean fclean re 