gegenbauer.quadrature.rules <- function( n, alpha )
{
###
### This function returns a list with n elements
### containing the order k quadrature rule data frames
### for orders k=1,2,...,n
### An order k quadrature data frame contains the roots and
### abscissa values for the Gegenbauer polynomial of degree k
###
### Parameters
### n = integer highest order
### alpha = polynomial parameter
###
    require( orthopolynom )
    if ( abs( alpha ) < 1e-6 )
        return( chebyshev.t.quadrature.rules( n ) )
    if ( abs( alpha - 0.5 ) < 1e-6 )
        return( legendre.quadrature.rules( n ) )
    if ( abs( alpha - 1.0 ) < 1e-6 )
        return( chebyshev.u.quadrature.rules( n ) )
    recurrences <- gegenbauer.recurrences( n, alpha )
    inner.products <- gegenbauer.inner.products( n, alpha )
    return( quadrature.rules( recurrences, inner.products ) )
}
