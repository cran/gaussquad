chebyshev.s.quadrature.rules <- function( n )
{
###
### This function returns a list with n elements
### containing the order k quadrature rule data frames
### for orders k=1,2,...,n.
### An order k quadrature data frame contains the roots and
### abscissa values for the Chebyshev polynomial
### of the second kind, Sk(x), and of degree k
###
### Parameter
### n = integer highest order
###
    require( orthopolynom )
    recurrences <- chebyshev.s.recurrences( n )
    inner.products <- chebyshev.s.inner.products( n )
    return( quadrature.rules( recurrences, inner.products ) )
}
