\name{quadrature.rule.table}
\alias{quadrature.rule.table}
\title{ Generate the quadrature rule table }
\description{
  This function returns a column-named data frame with 
  the given quadrature rules combined into a single object
}
\usage{
quadrature.rule.table(rules)
}
\arguments{
  \item{rules}{ A list of quadrature rule data frames }
}
\details{
  The column-named data frame has four columns.  The first column is called \code{d} and 
  it contains the degree of the orthogonal polynomial.  The second column is called \code{i} and 
  it contains the index of the rule for the given polynomial order.  The third column is called \code{x} and 
  it contains the abscissas, roots or zeros of the polynomial of given order.  
  The fourth column is called \code{w} and it contains the weights associated with the abscissas.
}
\value{
  A data frame with the quadrature rules.
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
### generate the list of quadrature rules for
### the Chebyshev T polynomials
### of orders 1 to 5
###
rules <- chebyshev.t.quadrature.rules( 5 )
###
### construct the rule table
###
rule.table <- quadrature.rule.table( rules )
print( rule.table )
}
\keyword{ math }
