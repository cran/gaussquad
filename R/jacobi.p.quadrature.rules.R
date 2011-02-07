jacobi.p.quadrature.rules <- function( n, a, b )
{
###
### This function returns a list with n elements
### containing the order k quadrature rule data frames
### for orders k=1,2,...,n
### An order k quadrature data frame contains the roots and
### abscissa values for the Jacobi polynomial, Pk(a,b,x), and
### of degree k
###
### Parameters
### n = integer highest order
### a = first polynomial parameter
### b = second polynomial parameter
###
    require( orthopolynom )
    recurrences <- jacobi.p.recurrences( n, a, b )
    inner.products <- jacobi.p.inner.products( n, a, b )
    return( quadrature.rules( recurrences, inner.products ) )
#    np1 <- n + 1
#    p.polynomials <- jacobi.p.polynomials( n, a, b )
#    p.inner.products <- jacobi.p.inner.products( n, a, b )
#    p.derivatives <- polynomial.derivatives( p.polynomials )
#    p.zeros <- as.list( rep( NULL, np1 ) )
#    for ( k in 1:np1 ) {
#        p.zeros[[k]] <- solve( p.polynomials[[k]] )
#    }
#    rules <- as.list( rep( NULL, n ) )
#    for ( k in 1:n ) {
#        ip.km1 <- p.inner.products[[k]]
#        x <- p.zeros[[k+1]]
#        w <- rep( 0, k )
#        p.km1 <- p.polynomials[[k]]
#        p.d.k <- p.derivatives[[k+1]]
#        for ( j in 1:k ) {
#            x.j <- x[j]
#            p.km1.x.j <- predict( p.km1, x.j )
#            p.d.k.x.j <- predict( p.d.k, x.j )
#            w[j] <- ip.km1 / ( p.km1.x.j * p.d.k.x.j )
#        }
#        rule <- data.frame( cbind( x,w ) )
#        names( rule ) <- c( "x", "w" )
#        rules[[k]] <- rule
#    }
#    return( rules )
}   
