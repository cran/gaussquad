\name{quadrature.rules}
\alias{quadrature.rules}
\title{ Create a list of quadrature rule data frames }
\description{
  This function returns a list with \eqn{n} elements containing 
  the order $k$ quadrature rule data frames 
  for orders \eqn{k = 1,\;2,\; \ldots ,\;n}.
}
\usage{
quadrature.rules(recurrences, inner.products)
}
\arguments{
  \item{recurrences}{ a data frame with the recurrence parameters of a particular orthogonal polynomial }
  \item{inner.products}{ a numeric vector of normed squared values of the orthogonal polynomials }
}
\details{
  An order \eqn{k} quadrature data frame is a named data frame that contains 
  the roots and abscissa values for the quadrature rule based on 
  an order \eqn{k} orthgonal polynomial.
}
\value{
  A list with \eqn{n} elements each of which is a quadrature rule data frame
  \item{1 }{Quadrature rule for the order 1 orthogonal polynomial}
  \item{2 }{Quadrature rule for the order 2 orthogonal polynomial}
  ...
  \item{n }{Quadrature rule for the order \eqn{n} orthogonal polynomial}
}
\references{ Abramwitz and Stegun (1968) }
\author{ Frederick Novomestky \email{fnovomes@poly.edu} }
\examples{
###
### get recurrences the Chebyshev T orthgonal polynomials
### of orders 0 to 6\5
###
recurrences <- chebyshev.t.recurrences( 5 )
###
### get the inner products of these polynomials
###
inner.products <- chebyshev.t.inner.products( 5 )
###
### get the quadrature rules
###
rules <- quadrature.rules( recurrences, inner.products )
print( rules )
}
\keyword{ math }
