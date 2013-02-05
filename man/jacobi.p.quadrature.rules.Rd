\name{jacobi.p.quadrature.rules}
\alias{jacobi.p.quadrature.rules}
\title{ Create list of Jacobi quadrature rules }
\description{
  This function returns a list with n elements containing 
  the order \eqn{k} quadrature rule data frame for 
  the Jacobi P polynomial 
  for orders \eqn{k = 1,\;2,\; \ldots ,\;n}.
}
\usage{
jacobi.p.quadrature.rules(n,alpha,beta,normalized=FALSE)
}
\arguments{
  \item{n}{ integer value for the highest order }
  \item{alpha}{ numeric value for the first polynomial parameter }
  \item{beta}{ numeric value for the second polynomial parameter }
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
  A list with \eqn{n} elements each of which is a quadrature rule data frame
  \item{1 }{Quadrature rule for the order 1 Jacobi polynomial}
  \item{2 }{Quadrature rule for the order 2 Jacobi polynomial}
  ...
  \item{n }{Quadrature rule for the order \eqn{n} Jacobi polynomial}
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
### construct the list of quadrature rules for
### the Jacobi orthogonal polynomials
### of orders 1 to 5
### alpha = 3 and beta = 2
###
orthogonal.rules <- jacobi.p.quadrature.rules( 5, 3, 2 )
print( orthogonal.rules )
###
### construct the list of quadrature rules for
### the Jacobi orthonormal polynomials
### of orders 1 to 5
### alpha = 3 and beta = 2
###
orthonormal.rules <- jacobi.p.quadrature.rules( 5, 3, 2, TRUE )
print( orthonormal.rules )
}
\keyword{ math }
