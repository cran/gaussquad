\name{glaguerre.quadrature}
\alias{glaguerre.quadrature}
\title{ Perform Gauss Laguerre quadrature }
\description{
  This function evaluates the integral of the given function between 
  the lower and upper limits using the weight and abscissa values specified in 
  the rule data frame.  The quadrature formula uses the weight function for
  generalized Laguerre polynomials.
}
\usage{
glaguerre.quadrature(functn, rule, alpha = 0, lower = 0, upper = Inf, 
weighted = TRUE, ...)
}
\arguments{
  \item{functn}{ an R function which should take a numeric argument x and 
  possibly some parameters.  The function returns a numerical vector value 
  for the given argument x. }
  \item{rule}{ a data frame containing the order \eqn{n} generalized Laguerre quadrature rule }
  \item{alpha}{ numeric value for the generalized Laguerre polynomial parameter }
  \item{lower}{ numeric value for the lower limit of the integral with a default value of 0 }
  \item{upper}{ numeric value for the upper limit of the integral with a default value of Inf }
  \item{weighted}{ a boolean value which if true causes the generalized Laguerre weight function 
  to be included in the integrand }
  \item{\dots}{ other arguments passed to the give function }
}
\details{
  The rule argument corresponds to an order \eqn{n} generalized Laguerre polynomial, 
  weight function and interval \eqn{\left[ {0,\infty } \right)}.  
  The one limit of the integral must be finite and the other must be infinite.
}
\value{
  The value of definite integral evaluated using Gauss Laguerre quadrature
}  
\references{
Abramowitz, M. and I. A. Stegun, 1968. \emph{Handbook of Mathematical Functions with
Formulas, Graphs, and Mathematical Tables}, Dover Publications, Inc., New York.

Press, W. H., S. A. Teukolsky, W. T. Vetterling, and B. P. Flannery, 1992. 
\emph{Numerical Recipes in C}, Cambridge University Press, Cambridge, U.K.

Stroud, A. H., and D. Secrest, 1966. \emph{Gaussian Quadrature Formulas},
Prentice-Hall, Englewood Cliffs, NJ.
}
\author{ Frederick Novomestky \email{fnovomes@poly.edu} }
\seealso{
\code{\link{glaguerre.quadrature.rules}}
 }
\examples{
###
### this example evaluates the quadrature function for
### the generalized Laguerre polynomials.  it computes the integral
### of the product for all pairs of orthogonal polynomials
### from order 0 to order 12.  the results are compared to
### the diagonal matrix of the inner products for the
### polynomials.  it also computes the integral of the product
### of all pairs of orthonormal polynomials from order 0
### to order 12.  the resultant matrix should be an identity matrix
###
###
### set the polynomial parameter
###
alpha <- 1
###
### set the value for the maximum polynomial order
###
    n <- 12
###
### maximum order plus 1
###
    np1 <- n + 1
###
### function to construct the polynomial products by column
###
by.column.products <- function( c, p.list, p.p.list )
{
###
### function to construct the polynomial products by row
###
    by.row.products <- function( r, c, p.list )
    {
        row.column.product <- p.list[[r]] * p.list[[c]]
        return (row.column.product )
    }
    np1 <- length( p.list )
    row.list <- lapply( 1:np1, by.row.products, c, p.list )
    return( row.list )
}
###
### function construct the polynomial functions by column
###
by.column.functions <- function( c, p.p.products )
{
###
### function to construct the polynomial functions by row
###
    by.row.functions <- function( r, c, p.p.products )
    {
        row.column.function <- as.function( p.p.products[[r]][[c]] )
        return( row.column.function )
    }
    np1 <- length( p.p.products[[1]] )
    row.list <- lapply( 1:np1, by.row.functions, c, p.p.products )
    return( row.list )
}
###
### function to compute the integral of the polynomials by column
###
by.column.integrals <- function( c, p.p.functions )
{
###
### function to compute the integral of the polynomials by row
###
    by.row.integrals <- function( r, c, p.p.functions )
    {
        row.column.integral <- glaguerre.quadrature(
            p.p.functions[[r]][[c]], order.np1.rule, alpha )
        return( row.column.integral )
    }
    np1 <- length( p.p.functions[[1]] )
    row.vector <- sapply( 1:np1, by.row.integrals, c, p.p.functions )
    return( row.vector )
}
###
### construct a list of the generalized Laguerre orthogonal polynomials
###
p.list <- glaguerre.polynomials( n, alpha )
###
### construct the two dimensional list of pair products
### of polynomials
###
p.p.products <- lapply( 1:np1, by.column.products, p.list )
###
### compute the two dimensional list of functions
### corresponding to the polynomial products in
### the two dimensional list p.p.products
###
p.p.functions <- lapply( 1:np1, by.column.functions, p.p.products )
###
### get the rule table for the order np1 polynomial
###
rules <- glaguerre.quadrature.rules( np1, alpha )
order.np1.rule <- rules[[np1]]
###
### construct the square symmetric matrix containing
### the definite integrals over the default limits
### corresponding to the two dimensional list of
### polynomial functions
###
p.p.integrals <- sapply( 1:np1, by.column.integrals, p.p.functions )
###
### construct the diagonal matrix with the inner products
### of the orthogonal polynomials on the diagonal
###
p.p.inner.products <- diag( glaguerre.inner.products( n,alpha ) )
print( "Integral of cross products for the orthogonal polynomials " )
print( apply( p.p.integrals, 2, round, digits=6 ) )
print( apply( p.p.inner.products, 2, round, digits=6 ) )
###
### construct a list of theg generalized Laguerre orthonormal polynomials
###
p.list <- glaguerre.polynomials( n, alpha, TRUE )
###
### construct the two dimensional list of pair products
### of polynomials
###
p.p.products <- lapply( 1:np1, by.column.products, p.list )
###
### compute the two dimensional list of functions
### corresponding to the polynomial products in
### the two dimensional list p.p.products
###
p.p.functions <- lapply( 1:np1, by.column.functions, p.p.products )
###
### get the rule table for the order np1 polynomial
###
rules <- glaguerre.quadrature.rules( np1, alpha, TRUE )
order.np1.rule <- rules[[np1]]
###
### construct the square symmetric matrix containing
### the definite integrals over the default limits
### corresponding to the two dimensional list of
### polynomial functions
###
p.p.integrals <- sapply( 1:np1, by.column.integrals, p.p.functions )
###
### display the matrix of integrals
###
print( "Integral of cross products for the orthonormal polynomials " )
print(apply( p.p.integrals, 2, round, digits=6 ) )
}
\keyword{ math }
