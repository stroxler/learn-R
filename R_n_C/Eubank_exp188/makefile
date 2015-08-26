all: clean run

clean:
	rm -f X.o X_wrapper.o X.so

run: compiled
	R -f X_driver.R

# note that the .so file is called X.so... it appears R CMD SHLIB uses the
# first argument for the name of the library
compiled:
	R CMD SHLIB X.cpp X_wrapper.cpp
