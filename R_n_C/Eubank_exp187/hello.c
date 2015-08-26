#include "R.h"

/**
 * Hello word for running C from R
 *
 * Prints a hello message *n times, and increments *n
 */
void hello(int * n) {
  int i;
  for (i = 0; i < *n; i++) {
    Rprintf("Hi y'all %d times!\n", i);
  }
  *n += 1;
}
