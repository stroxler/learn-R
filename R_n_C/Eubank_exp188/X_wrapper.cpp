#include "X.h"

// provide a C-bindable wrapper around the C++ code
extern "C" {

  void func(int * n) {
    X x(*n);
  }
}
