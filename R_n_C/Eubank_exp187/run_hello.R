dyn.load("hello.so")
is.loaded("hello")
n_in = as.integer(3)
n_out = .C("hello", n_in)

# print the results. Note that .C returns a list containing the
# arguments, which were copied from the R inputs (we know they
# are copied because `n` does not change) and passed as pointers.

# The .C interface works for very simple data.

cat('n_in is')
cat(str(n_in))
cat('')
cat('n_out is')
cat(str(n_out))
