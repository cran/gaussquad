ghermite.h.quadrature.rules <- function( n, mu )
{
###
###	This function returns a list with n elements
###	containing the order k quadrature rule data frames
###	for orders k=1,2,...,n
###	An order k quadrature data frame contains the roots and
###	abscissa values for the degree k normalized Hermite polynomial
###
###	Parameter
###	n = integer highest order
###
	require( orthopolynom )
	recurrences <- ghermite.h.recurrences( n, mu, normalized=TRUE )
	inner.products <- ghermite.h.inner.products( n, mu )
	return( quadrature.rules( recurrences, inner.products ) )
}
