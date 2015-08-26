To set up a minimal Rcpp package, you'll do (in R):
```
library(devtools)
create('mypackage')
use_rcpp().
```

Once you've called use_rcpp, you need to go into one of your R files (it can
be any one of them) and add the blurb that `use_rcp()` spits out as an roxygen
tag on some throwaway value (e.g., NULL).

This causes `library(devtools); document()` to use the appropriate metadata for
linking your dynamically linked library. If you reach the point where your Rcpp
code seems to be getting generated, but the `.Call()` calls are failing, it's
likely that this tag got messed up somehow.

At this point, hack away! You'll likely want to have lots of tests for the
C++ code. I don't know whether it's easy to use a C++ unit testing framework
for your inner logic, but certainly one upside to developing in R is that the
high-level logic can be tested out in a dynamic environment! To set up unit
testing for your package, call `library(devtools); use_testthat()`
