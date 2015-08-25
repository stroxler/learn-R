context('J')

n <- 10
p <- 3
beta <- rnorm(p)
X <- matrix(rnorm(n*p), n, p)

test_that('Returns 0 if y == X \\beta', {
  y <- X %*% beta
  # note that expect_equal handles numerical precision;
  # expect_identical expects true equality.
  expect_equal(J(X, y, beta), 0)
})

test_that('Returns the expected value when y != X \\beta', {
  y <- X %*% beta + 1
  # why 0.5? Because J is 1/(2m) times the sum squared error, and all
  # errors are 1 here.
  expect_equal(J(X, y, beta), 0.5)
})
