chebyshev.u.quadrature <- function( functn, rule, lower=-1, upper=1, weighted=TRUE, ... )
{
###
### This function evaluates the integral of the function functn
### between lower and upper using the weight and abscissa values specified
### in the rule data frame.  The rule corresponds to an order n
### Chebyshev polynomial of the second kind, U_n(x), weight function and interval [-1,1]
### Lower bound is finite and upper bound is finite.
###
### Parameters
### functn   = an R function which should take a numeric argument x and
###            possibly some parameters.  The function returns a
###            numerical vector value for the given argument x.
### rule     = a data frame containing the order n quadrature rule
### lower    = a scalar lower bound of the integral
### upper    = a scalar lower found of the integral.
### weighted = a boolean value which if true includes the weight function in the integrand
### ...      = other arguments passed to the function functn.
###
    if ( !is.function( functn ) )
        stop( "functn argument is not an R function" )
    if ( !is.data.frame( rule ) )
        stop( "rule argument is not a data frame" )
    if ( is.infinite( lower ) )
        stop( "lower bound is infinite" )
    if ( is.infinite( upper ) )
        stop( "lower bound is infinite" )
    if ( weighted ) {
        ff <- 
            if ( length( list( ... ) ) && length( formals( functn ) ) > 1 )
                function( x ) functn( x, ... )
            else
                functn
    }
    else {
        ff <- 
            if ( length( list( ... ) ) && length( formals( functn ) ) > 1 )
                function( x ) { functn( x, ... ) / chebyshev.u.weight( x ) }
            else
                function( x ) { functn( x ) / chebyshev.u.weight( x ) }
    }
    lambda <- ( upper - lower ) / ( 2 )
    mu <-     ( lower + upper ) / ( 2 )
    y <- lambda * rule$x + mu
    w <- rule$w
    return( lambda * sum( w * ff(y) ) )
}
