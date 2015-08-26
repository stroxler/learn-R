all: clean run

clean:
	rm -f rngEx.o rngEx.so

run: compile
	R -f try_rngEx.R

compile:
	R CMD SHLIB rngEx.cc
