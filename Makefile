all:
	ocamlbuild chaos_serptr.native -libs graphics

clean:
	ocamlbuild -clean

.PHONY: clean
