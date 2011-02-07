schebyshev.u.quadrature.rules <- function( n )
{
###
### This function returns a list with n elements
### containing the order k quadrature rule data frames
### for orders k=1,2,...,n.
### An order k quadrature data frame contains the roots and
### abscissa values for the shifted Chebyshev polynomial
### of the second kind, Uk(x), and of degree k
###
### Parameter
### n = integer highest order
###
    require( orthopolynom )
    recurrences <- schebyshev.u.recurrences( n )
    inner.products <- schebyshev.u.inner.products( n )
    return( quadrature.rules( recurrences, inner.products ) )
}
