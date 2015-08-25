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
