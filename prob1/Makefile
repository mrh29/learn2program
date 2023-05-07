all: hello

hello: hello.ml
	ocamlbuild -use-ocamlfind hello.byte

clean:
	rm -rf _build *.byte