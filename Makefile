all:
	ocamlbuild -cflags -I,+lablGL -lflags -I,+lablGL -lib lablgl -lib lablglut chaos_serptr.native

clean:
	ocamlbuild -clean

.PHONY: clean
