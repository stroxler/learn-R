#include <R.h>
#include <Rmath.h>
#include "X.h"

X::X(int n_) {
  n = n_;
  for (int i = 0; i < n; i++) {
    Rprintf("Hello world %d times!\n", i);
  }
  // demo colling a normal probability function from C++!
  Rprintf("Normal %f\n", pnorm(196, 0, 1, 1, 0));
}

X::~X() {
  for (int i = 0; i < n; i++) {
    Rprintf("Goodbye world %d times!\n", i);
  }
}
