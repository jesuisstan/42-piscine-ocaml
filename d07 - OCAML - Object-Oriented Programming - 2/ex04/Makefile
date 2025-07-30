NAME = alkane_combustion
SOURCES = alkane_combustion.ml
OBJECTS = $(SOURCES:.ml=.cmx)

OCAMLOPT = ocamlopt
OCAMLFLAGS = -c

all: $(NAME)

$(NAME): ../ex00/atom.cmx ../ex01/molecule.cmx ../ex02/alkane.cmx ../ex03/reaction.cmx $(OBJECTS)
	$(OCAMLOPT) -o $(NAME) ../ex00/atom.cmx ../ex01/molecule.cmx ../ex02/alkane.cmx ../ex03/reaction.cmx $(OBJECTS)

../ex00/atom.cmx: ../ex00/atom.ml
	$(OCAMLOPT) $(OCAMLFLAGS) $< -o $@

../ex01/molecule.cmx: ../ex01/molecule.ml ../ex00/atom.cmx
	$(OCAMLOPT) $(OCAMLFLAGS) $< -o $@

../ex02/alkane.cmx: ../ex02/alkane.ml ../ex00/atom.cmx ../ex01/molecule.cmx
	$(OCAMLOPT) $(OCAMLFLAGS) $< -o $@

../ex03/reaction.cmx: ../ex03/reaction.ml ../ex00/atom.cmx ../ex01/molecule.cmx
	$(OCAMLOPT) $(OCAMLFLAGS) $< -o $@

%.cmx: %.ml
	$(OCAMLOPT) $(OCAMLFLAGS) $<

clean:
	rm -f *.cmx *.cmi *.o $(NAME)

fclean: clean

re: fclean all

.PHONY: all clean fclean re 