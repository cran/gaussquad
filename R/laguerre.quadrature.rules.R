laguerre.quadrature.rules <- function ( n )
{
###
### This function returns a list with n elements
### containing the order k quadrature rule data frames
### for orders k=1,2,...n.
### An order k quadrature data frame contains the roots and
### abscissa values for the Laguerre polynomial of degree k.
###
### Parameter
### n = integer highest order
###
    require( orthopolynom )
    return( glaguerre.quadrature.rules( n, 0 ) )
}
