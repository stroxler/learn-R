dyn.load("X.so")
is.loaded("func")

.C("func", as.integer(3))
