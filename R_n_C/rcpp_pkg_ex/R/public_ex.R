#' @useDynLib rcppex
#' @importFrom Rcpp sourceCpp
NULL

#' Calls hello world for Rcpp
#'
#' @return a list of Rcpp output
#'
#' @export
call_rcpp_ex <- function() {
  rcpp_hello_world()
}
