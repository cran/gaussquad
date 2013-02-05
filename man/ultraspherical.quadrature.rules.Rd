\name{ultraspherical.quadrature.rules}
\alias{ultraspherical.quadrature.rules}
\title{ Create list of ultraspherical quadrature rules }
\description{
  This function returns a list with \eqn{n} elements containing 
  the order \eqn{k} quadrature rule data frame for 
  the ultraspherical polynomial
  for orders \eqn{k = 1,\;2,\; \ldots ,\;n}.
}
\usage{
ultraspherical.quadrature.rules(n,alpha,normalized=FALSE)
}
\arguments{
  \item{n}{ integer value for the highest order }
  \item{alpha}{ numeric value for the polynomial parameter }
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
  \item{1 }{Quadrature rule data frame for the order 1 ultraspherical polynomial}
  \item{2 }{Quadrature rule data frame for the order 2 ultraspherical polynomial}
  ...
  \item{n }{Quadrature rule data frame for the order \eqn{n} ultraspherical polynomial}
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
  \code{\link{ultraspherical.quadrature}}
 }
\examples{
###
### generate a list of quadrature rules for
### the orthogonal ultraspherical polynomial
### of orders 1 to 5
### the polynomial parameter value alpha is 1.0
###
orthogonal.rules <- ultraspherical.quadrature.rules( 5, 1 )
print( orthogonal.rules )
###
### generate a list of quadrature rules for
### the orthonormal ultraspherical polynomial
### of orders 1 to 5
### the polynomial parameter value alpha is 1.0
###
orthonormal.rules <- ultraspherical.quadrature.rules( 5, 1, TRUE )
print( orthonormal.rules )
}
\keyword{ math }
