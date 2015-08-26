all: clean doc compile demo

demo:
	R -e 'library(devtools); load_all(); rcppex::rcpp_hello_world()'

compile:
	R -e 'library(Rcpp); compileAttributes()'

doc:
	R -e 'library(devtools); document()'

clean:
	rm -f src/*.o src/*.so src/RcppExports.cpp R/RcppExports.R
