NAME = main
SOURCES = atom.ml molecule.ml alkane.ml reaction.ml alkane_combustion.ml main.ml
OBJECTS = $(SOURCES:.ml=.cmx)

all: $(NAME)

$(NAME): $(OBJECTS)
	ocamlopt -o $(NAME) $(OBJECTS)

atom.cmx: atom.ml
	ocamlopt -c atom.ml

molecule.cmx: molecule.ml atom.cmx
	ocamlopt -c molecule.ml

alkane.cmx: alkane.ml atom.cmx molecule.cmx
	ocamlopt -c alkane.ml

reaction.cmx: reaction.ml atom.cmx molecule.cmx
	ocamlopt -c reaction.ml

alkane_combustion.cmx: alkane_combustion.ml atom.cmx molecule.cmx alkane.cmx reaction.cmx
	ocamlopt -c alkane_combustion.ml

main.cmx: main.ml atom.cmx molecule.cmx alkane.cmx reaction.cmx alkane_combustion.cmx
	ocamlopt -c main.ml

clean:
	rm -f *.cmx *.cmi *.o $(NAME)

fclean: clean

re: fclean all

.PHONY: all clean fclean re 