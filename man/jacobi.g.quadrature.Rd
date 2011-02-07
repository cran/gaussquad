\name{jacobi.g.quadrature}
\alias{jacobi.g.quadrature}
\title{ Perform Gauss Jacobi quadrature }
\description{
  This function evaluates the integral of the given function between 
  the lower and upper limits using the weight and abscissa values specified in 
  the rule data frame.  The quadrature formula uses the weight function for
  Jacobi G polynomials.
}
\usage{
jacobi.g.quadrature(functn, rule,  p = 0, q = 0, lower = 0, upper = 1, 
weighted = TRUE, ...)
}
\arguments{
  \item{functn}{ an R function which should take a numeric argument x and 
  possibly some parameters.  The function returns a numerical vector value 
  for the given argument x. }
  \item{rule}{ a data frame containing the order \eqn{n} ultraspherical quadrature rule }
  \item{p}{ numeric value for the first Jacobi polynomial parameter }
  \item{q}{ numeric value for the second Jacobi polynomial parameter }
  \item{lower}{ numeric value for the lower limit of the integral with a default value of 0 }
  \item{upper}{ numeric value for the upper limit of the integral with a default value of 1 }
  \item{weighted}{ boolean value which if true causes the ultraspherical weight function 
  to be included in the integrand }
  \item{\dots}{ other arguments passed to the give function }
}
\details{
  The rule argument corresponds to an order \eqn{n} Jacobi polynomial, 
  weight function and interval \eqn{\left[ {0,1} \right]}.  
  The lower and upper limits of the integral must be finite.
}
\value{
  The value of definite integral evaluated using Gauss Jacobi quadrature
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
\code{\link{jacobi.p.quadrature.rules}}
 }
\examples{
###
### this example evaluates the quadrature function for
### the Jacobi G polynomials.  it computes the integral
### of the product for all pairs of orthogonal polynomials
### from order 0 to order 5.  the results are compared to
### the diagonal matrix of the inner products for the
### polynomials
###
### construct a list of the Jacobi G polynomials
### of orders 0 to 5
### parameter p is 3 and parameter q is 2
###
p <- 3
q <- 2
p.list <- jacobi.g.polynomials( 5, p, q )
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
    row.list <- lapply( 1:6, by.row.products, c, p.list )
    return( row.list )
}
###
### construct the two dimensional list of pair products
### of polynomials
###
p.p.products <- lapply( 1:6, by.column.products, p.list )
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
    row.list <- lapply( 1:6, by.row.functions, c, p.p.products )
    return( row.list )
}
###
### compute the two dimensional list of functions
### corresponding to the polynomial products in
### the two dimensional list p.p.products
###
p.p.functions <- lapply( 1:6, by.column.functions, p.p.products )
###
### get the rule table for the order 6 polynomial
###
rules <- jacobi.g.quadrature.rules( 6, p, q )
order.6.rule <- rules[[6]]
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
        row.column.integral <- jacobi.g.quadrature(
            p.p.functions[[r]][[c]], order.6.rule, p, q )
        return( row.column.integral )
    }
    row.vector <- sapply( 1:6, by.row.integrals, c, p.p.functions )
    return( row.vector )
}
###
### construct the square symmetric matrix containing
### the definite integrals over the default limits
### corresponding to the two dimensional list of
### polynomial functions
###
p.p.integrals <- sapply( 1:6, by.column.integrals, p.p.functions )
###
### construct the diagonal matrix with the inner products
### of the orthogonal polynomials on the diagonal
###
p.p.inner.products <- diag( jacobi.g.inner.products( 5, p, q ) )
print( p.p.integrals )
print( p.p.inner.products )
}
\keyword{ math }
