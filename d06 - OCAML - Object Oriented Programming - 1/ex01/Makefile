NAME = main
SOURCES = people.ml doctor.ml main.ml
OBJECTS = $(SOURCES:.ml=.cmx)

all: $(NAME)

$(NAME): $(OBJECTS)
	ocamlopt -o $(NAME) $(OBJECTS)

people.cmx: people.ml
	ocamlopt -c people.ml

doctor.cmx: doctor.ml people.cmx
	ocamlopt -c doctor.ml

main.cmx: main.ml people.cmx doctor.cmx
	ocamlopt -c main.ml

clean:
	rm -f *.cmx *.cmi *.o $(NAME)

fclean: clean

re: fclean all

.PHONY: all clean fclean re 