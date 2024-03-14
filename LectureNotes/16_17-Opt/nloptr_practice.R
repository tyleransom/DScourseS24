library(nloptr)
# Our objective function
eval_f <- function(x) {
return( x[1]^4 - 3*x[1]^3 + 2 )
}
# Gradient of our objective function
eval_grad_f <- function(x) {
return( 4*x[1]^3 - 9*x[1]^2 )
}
# initial values
x0 <- -5
# Algorithm parameters
opts <- list("algorithm"="NLOPT_LD_LBFGS","xtol_rel"=1.0e-8)
# Find the optimum!
res <- nloptr( x0=x0,eval_f=eval_f,eval_grad_f=eval_grad_f,opts=opts)
print(res)





# initial values
xstart <- 5
# Algorithm parameters
options <- list("algorithm"="NLOPT_LN_NELDERMEAD","xtol_rel"=1.0e-8)
# Find the optimum!
res <- nloptr( x0=xstart,eval_f=eval_f,opts=options)
print(res)
