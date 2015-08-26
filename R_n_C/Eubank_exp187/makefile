all: clean run

clean:
	rm hello.o hello.so

run: hello
	R -f run_hello.R

hello:
	R CMD SHLIB hello.c
