jacobi.g.quadrature.rules <- function( n, p, q )
{
###
### This function returns a list with n elements
### containing the order k quadrature rule data frames
### for orders k=1,2,...,n
### An order k quadrature data frame contains the roots and
### abscissa values for the Jacobi polynomial, Gk(a,b,x), and
### of degree k
###
### Parameters
### n = integer highest order
### p = first polynomial parameter
### q = second polynomial parameter
###
    require( orthopolynom )    
    alpha <- q - 1
    beta <- p - q
    slegendre.rules <- slegendre.quadrature.rules( n )
    jacobi.p.rules <- jacobi.p.quadrature.rules( n, alpha, beta )
    jacobi.g.rules <- as.list( rep( NULL, n ) )
    scale <- 2 ^ p
    for ( k in 1:n ) {
        p.rule <- jacobi.p.rules[[k]]
        p.x <- p.rule$x
        p.w <- p.rule$w
        g.x <- 0.5 * ( p.x + 1 )
        g.w <- p.w / scale
        g.rule <- data.frame( cbind( g.x, g.w ) )
        names( g.rule ) <- c( "x", "w" )
        jacobi.g.rules[[k]] <- g.rule
    }
    rules <- as.list( rep( NULL, n ) )
    for ( k in 1:n ) {
        jacobi.g.rule <- jacobi.g.rules[[k]]
        slegendre.rule <- slegendre.rules[[k]]
        rule <- list ( jacobi.g.rule=jacobi.g.rule, slegendre.rule=slegendre.rule )
        rules[[k]] <- rule
    }
    return( rules )
}
