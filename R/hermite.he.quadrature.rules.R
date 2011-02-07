hermite.he.quadrature.rules <- function( n )
{
###
###	This function returns a list with n elements
###	containing the order k quadrature rule data frames
###	for orders k=1,2,...,n
###	An order k quadrature data frame contains the roots and
###	abscissa values for the degree k normalized scaled Hermite polynomial
###
###	Parameter
###	n = integer highest order
###
	require( orthopolynom )
	recurrences <- hermite.he.recurrences( n, normalized=TRUE )
	inner.products <- hermite.he.inner.products( n )
	return( quadrature.rules( recurrences, inner.products ) )
}
