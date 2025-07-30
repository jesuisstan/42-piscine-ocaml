NAME = main
SOURCES = atom.ml molecule.ml main.ml
OBJECTS = $(SOURCES:.ml=.cmx)

all: $(NAME)

$(NAME): $(OBJECTS)
	ocamlopt -o $(NAME) $(OBJECTS)

atom.cmx: atom.ml
	ocamlopt -c atom.ml

molecule.cmx: molecule.ml atom.cmx
	ocamlopt -c molecule.ml

main.cmx: main.ml atom.cmx molecule.cmx
	ocamlopt -c main.ml

clean:
	rm -f *.cmx *.cmi *.o $(NAME)

fclean: clean

re: fclean all

.PHONY: all clean fclean re 