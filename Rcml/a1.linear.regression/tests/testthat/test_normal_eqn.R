set.seed(666)

context('normal equations solution')

test_that('Sould approximately recover underlying with large n', {
  n <- 1000
  p <- 3
  beta <- rnorm(p)
  X <- matrix(rnorm(n*p), n, p)
  y <- X %*% beta + 0.1 * rnorm(n)
  expect_less_than(sum((betahat_normaleqn(X, y) - beta) ** 2), 1e-3)
})
