#' Compute the normal equations solution to least-squares
#' \eqn{ (X^T X)^{-1} X^T y }
#'
#' @param X a matrix of covariates (n by p)
#' @param y a vector of outcomes (n)
#' @return the normal equations least-squares \eqn{ \hat \beta }
#'
#' @export
betahat_normaleqn = function(X, y) {
  betahat <- solve(t(X) %*% X, t(X) %*% y)
  betahat
}


#' Compute the linear regression loss function
#' \eqn{ J(\beta) = \frac{1}{2m} \sum_{i=1}^N (\hat y_i(\beta) - y_i) }
#'
#' @param X a matrix of covariates (n by p)
#' @param y a vector of outcomes (n)
#' @param beta a vector of coefficients (p)
#' @return the loss function \eqn{J(\beta)} evaluated on \code{X} and \code{y}.
#'
#' @export
J = function(X, y, beta) {
  m <- length(y)
  eps <- X %*% beta - y
  0.5 / m * sum(eps * eps)
}

#' Take a gradient descent step toward the least-squares optimum
#'
#' @param X a matrix of covariates (n by p)
#' @param y a vector of outcomes (n)
#' @param betahat a vector of coefficients (p)
#' @param alpha the step size (initial - we do backtracking)
#' @return an update to betahat from a gradient-descent step
#'         with backtracking
#'
#' @export
gradient_descent_step <- function(X, y, betahat, alpha) {
  r <- y - X %*% betahat
  step <- alpha * t(X) %*% r
  Jstart <- J(X, y, betahat)
  while (J(X, y, betahat + step) > Jstart) {
    step <- step * 0.5
  }
  betahat + step
}

#' Find betahat via gradient descent one observation at a time
#'
#' @param X a matrix of covariates (n by p)
#' @param y a vector of outcomes (n)
#' @param alpha the step size (initial - we do backtracking)
#' @param niter the number of iterations
#' @return list.. $betahat - extimates $Js - loss function values
#'
#' @export
betahat_gradient_descent_blockwise <- function(X, y, alpha, niter) {
  Js = rep(0, niter)
  dims = dim(X)
  n = dims[1]
  p = dims[2]
  betahat = rep(0, p)
  for (i in 1:niter) {
    betahat = gradient_descent_step(X, y, betahat, alpha)
    Js[i] = J(X, y, betahat)
  }
  list(betahat = betahat, Js = Js)
}

#' Find betahat via gradient descent one observation at a time
#'
#' @param X a matrix of covariates (n by p)
#' @param y a vector of outcomes (n)
#' @param alpha the step size * n (initial - we do backtracking)
#' @param niter the number of iterations
#' @return list.. $betahat - extimates $Js - loss function values
#'
#' @export
betahat_gradient_descent <- function(X, y, alpha, niter) {
  Js = rep(0, niter)
  dims = dim(X)
  n = dims[1]
  p = dims[2]
  betahat = rep(0, p)
  for (i in 1:niter) {
    for (j in 1:n) {
      X_ = matrix(X[j,], 1, p)
      y_ = rep(y[j], 1)
      betahat = gradient_descent_step(X_, y_, betahat, alpha / n)
    }
    Js[i] = J(X, y, betahat)
  }
  list(betahat = betahat, Js = Js)
}
