\name{jacobi.g.quadrature.rules}
\alias{jacobi.g.quadrature.rules}
\title{ Create list of Jacobi quadrature rules }
\description{
  This function returns a list with \eqn{n} elements containing 
  the order \eqn{k} quadrature rule data frame for 
  the Jacobi G polynomial
  for orders \eqn{k = 1,\;2,\; \ldots ,\;n}.
}
\usage{
jacobi.g.quadrature.rules(n,p,q)
}
\arguments{
  \item{n}{ integer value for the highest order }
  \item{p}{ numeric value for the first polynomial parameter }
  \item{q}{ numeric value for the second polynomial parameter }
}
\details{
  An order \eqn{k} quadrature data frame is a named data frame that contains 
  the roots and abscissa values of the corresponding order \eqn{k} orthogonal polynomial.  
  The column with name \code{x} contains the roots or zeros and 
  the column with name \code{w} contains the weights.
}
\value{
  A list with \eqn{n} elements each of which is a data frame
  \item{1 }{Quadrature rule data frame for the order 1 Jacobi polynomial}
  \item{2 }{Quadrature rule data frame for the order 2 Jacobi polynomial}
  ...
  \item{n }{Quadrature rule data frame for the order \eqn{n} Jacobi polynomial}
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
  \code{\link{quadrature.rules}}
}
\examples{
###
### generate the list of quadrature rule data frames for
### the Jacobi G polynomial
### of orders 1 to 5
### parameter p is 3 and parameter q is 2
###
rules <- jacobi.g.quadrature.rules( 5, 3, 2 )
print( rules )
}
\keyword{ math }
