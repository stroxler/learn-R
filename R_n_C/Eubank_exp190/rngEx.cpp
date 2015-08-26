#include <R.h>
#include <Rmath.h>

extern "C" {

  /**
   * Fills a size-*n double array x with pseudorandom normal numbers
   * with mean *mu and std *sig
   */
  void rngFunc(int * n, double * mu, double * sig, double * x) {
    GetRNGstate();  // must be called before any random number generation
    for (int i = 0; i < *n; i++) {
      x[i] = rnorm(*mu, *sig);
    }
    PutRNGstate();  // must be called after an random number generation, before control returns to R
  }
}
