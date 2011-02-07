slegendre.quadrature.rules <- function( n )
{
###
###	This function returns a list with n elements
###	containing the order k quadrature rule data frames
###	for orders k=1,2,...,n.
###	An order k quadrature data frame contains the roots and
###	abscissa values for the order k shifted Legendre polynomial.
###
###	Parameter
###	n = integer highest order
###
	require( orthopolynom )
	recurrences <- slegendre.recurrences( n )
	inner.products <- slegendre.inner.products( n )
	return( quadrature.rules( recurrences, inner.products ) )
}	