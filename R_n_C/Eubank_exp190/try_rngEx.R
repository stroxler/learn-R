dyn.load("rngEx.so")


my_randn <- function(n, mu, sig) {
  x <- vector("double", n)
  set.seed(123)
  # In this call, as we saw earlier, x is copied before passing it to
  # the C code. As a result, x is not modified by this call, but the
  # last entry of the list `result` is a double vector of the suitable size
  result <- .C("rngFunc", as.integer(n), as.double(mu), as.double(sig), x)
  result[[4]]
}

my_randn(3, 1, 0.5)
