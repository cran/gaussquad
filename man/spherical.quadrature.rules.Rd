\name{spherical.quadrature.rules}
\alias{spherical.quadrature.rules}
\title{ Create list of shperical quadrature rules }
\description{
  This function returns a list with \eqn{n} elements containing 
  the order \eqn{k} quadrature rule data frame for 
  the shperical polynomial 
  for orders \eqn{k = 1,\;2,\; \ldots ,\;n}.
}
\usage{
spherical.quadrature.rules(n,normalized=FALSE)
}
\arguments{
  \item{n}{ integer value for the highest order }
  \item{normalized}{ boolean value.  if TRUE rules are for orthonormal
  polynomials, otherwise they are for orthgonal polynomials }
}
\details{
  An order \eqn{k} quadrature data frame is a named data frame that contains 
  the roots and abscissa values of the corresponding order \eqn{k} orthogonal polynomial.  
  The column with name \code{x} contains the roots or zeros and 
  the column with name \code{w} contains the weights.
}
\value{
  A list with \eqn{n} elements each of which is a data frame
  \item{1 }{Quadrature rule data frame for the order 1 spherical polynomial}
  \item{2 }{Quadrature rule data frame for the order 2 spherical polynomial}
  ...
  \item{n }{Quadrature rule data frame for the order \eqn{n} spherical polynomial}
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
  \code{\link{quadrature.rules}},
  \code{\link{spherical.quadrature}}
}
\examples{
###
### generate a list of quadrature rule data frames for
### the orthogonal spherical polynomials
### of orders 1 to 5
###
orthogonal.rules <- spherical.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate a list of quadrature rule data frames for
### the orthonormal spherical polynomials
### of orders 1 to 5
###
orthonormal.rules <- spherical.quadrature.rules( 5, TRUE )
print( orthonormal.rules )
}
\keyword{ math }
