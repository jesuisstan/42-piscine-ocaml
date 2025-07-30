NAME = atom
SOURCES = atom.ml
OBJECTS = $(SOURCES:.ml=.cmx)

OCAMLOPT = ocamlopt
OCAMLFLAGS = -c

all: $(NAME)

$(NAME): $(OBJECTS)
	$(OCAMLOPT) -o $(NAME) $(OBJECTS)

%.cmx: %.ml
	$(OCAMLOPT) $(OCAMLFLAGS) $<

clean:
	rm -f *.cmx *.cmi *.o $(NAME)

fclean: clean

re: fclean all

.PHONY: all clean fclean re 