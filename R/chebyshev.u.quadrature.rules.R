chebyshev.u.quadrature.rules <- function ( n )
{
###
###	This function returns a list with n elements
###	containing the order k quadrature rule data frames
###	for orders k=1,2,...,n
###	An order k quadrature data frame contains the roots and
###	abscissa values for the Chebyshev polynomial of
###	the second kind, Uk(x), and degree k
###
###	Parameter
###	n = integer highest order
###
	require( orthopolynom )
	if ( n <= 0 )
		stop( "highest order is not positive" )
	if ( n != round( n ) )
		stop( "highest order is not an integer" )
	rules <- as.list( rep( NULL, n ) )
	k <- 1
	while ( k <= n ) {
		x <- rep( 0, k )
		w <- rep( 0, k )
		for ( j in 1:k ) {
			x[j] <- cos ( (j * pi ) / ( k + 1) )
			w[j] <- ( pi / ( k + 1 ) ) * ( sin( ( j * pi ) / ( k + 1 ) ) ) ^ 2
		}
		rule <- data.frame( cbind( x, w ) )
		rules[[k]] <- rule
		k <- k + 1
	}
	return ( rules )
}
