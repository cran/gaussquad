ultraspherical.quadrature.rules <- function( n, alpha )
{
###
###	This function returns a list with n elements
###	containing the order k quadrature rule data frames
###	for orders k=1,2,...,n.
###	An order k quadrature data frame contains the roots and
###	abscissa values for the ultraspherical polynomial of degree k
###
###	Parameters
###	n = integer highest order
###	alpha = polynomial parameter
###
	require( orthopolynom )
	return( gegenbauer.quadrature.rules( n, alpha ) )
}	
