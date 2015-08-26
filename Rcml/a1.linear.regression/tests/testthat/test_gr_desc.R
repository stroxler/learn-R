set.seed(666)
n <- 50
p <- 3
beta <- rnorm(p)
X <- matrix(rnorm(n*p), n, p)
y <- X %*% beta + 0.1 * rnorm(n)

context('gradient_descent solution')

is_descending = function(vec) {
  for (i in 2:length(vec)) {
    if(vec[i] > vec[i-1]) {
      return(F)
    }
  }
  return(T)
}

test_that('Should produce descending J when blockwise', {
  grad_desc_out <- betahat_gradient_descent_blockwise(X, y, alpha = 0.5, 50)
  expect_true(is_descending(grad_desc_out$Js))
})

test_that('Sould approximately recover ols when y is almost nonrandom', {
  betahat_ols <- betahat_normaleqn(X, y)
  grad_desc_out <- betahat_gradient_descent(X, y, alpha = 0.5, 20)
  expect_less_than(sum((grad_desc_out$betahat - beta) ** 2), 1e-3)
})
