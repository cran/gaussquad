chebyshev.c.quadrature.rules <- function( n )
{
###
### This function returns a list with n elements
### containing the order k quadrature rule data frames
### for orders k=1,2,...,n.
### An order k quadrature data frame contains the roots and
### abscissa values for the order k Chebyshev polynomial
### of the first kind, Ck(x), and of degree k
###
### Parameter
### n = integer highest order
###
    require( orthopolynom )
    rules <- as.list( rep( NULL, n ) )
    k <- 1
    while ( k <= n ) {
        x <- rep( 0, k )
        w <- rep( 2 * pi / k, k )
        for ( j in 1:k ) {
            x[j] <- 2 * cos ( ( ( 2 * j - 1 ) * pi ) / ( 2 * k ) )
        }
        rule <- data.frame( cbind( x, w ) )
        rules[[k]] <- rule
        k <- k + 1
    }
    return ( rules )
}   
