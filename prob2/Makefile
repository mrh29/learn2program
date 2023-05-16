all: validate_pass

validate_pass: validate_pass.ml
	ocamlbuild -use-ocamlfind validate_pass.byte

clean:
	rm -rf _build *.byte