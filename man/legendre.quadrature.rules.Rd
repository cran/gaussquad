\name{legendre.quadrature.rules}
\alias{legendre.quadrature.rules}
\title{ Create list of Legendre quadrature rules }
\description{
  This function returns a list with \eqn{n} elements containing 
  the order \eqn{k} quadrature rule data frame for 
  the Legendre polynomial
  for orders \eqn{k = 1,\;2,\; \ldots ,\;n}.
}
\usage{
legendre.quadrature.rules(n)
}
\arguments{
  \item{n}{ integer value for the highest order }
}
\details{
  An order \eqn{k} quadrature data frame is a named data frame that contains 
  the roots and abscissa values of the corresponding order \eqn{k} orthogonal polynomial.  
  The column with name \code{x} contains the roots or zeros and 
  the column with name \code{w} contains the weights.
}
\value{
  A list with $n$ elements each of which is a data frame
  \item{1 }{Quadrature rule data frame for the order 1 Legendre polynomial}
  \item{2 }{Quadrature rule data frame for the order 2 Legendre polynomial}
  ...
  \item{n }{Quadrature rule data frame for the order $n$ Legendre polynomial}
}
\references{ Abramowitz and Stegun (1968), Press et. al. (1992) }
\author{ Frederick Novomestky \email{fnovomes@poly.edu} }
\seealso{
\code{\link{quadrature.rules}}
 }
\examples{
###
### generate a list of quadrature rule frames for
### the Legendre polynomials
### of orders 1 to 5
###
rules <- legendre.quadrature.rules( 5 )
print( rules )
}
\keyword{ math }
