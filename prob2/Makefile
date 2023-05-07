all: validate_pass
.PHONY: all

validate_pass: clean
	clang -O2 -Wall validate_pass.c -o validate_pass

.PHONY: clean
clean: 
	-rm validate_pass