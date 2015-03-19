## Cache Matrix provides read-through cache optimized matrix inversion 
## functionality. 

## High-level requirements overview:
##  Computing the inverse of a square matrix can be done with the solve 
##  function in R. For example, if X is a square invertible matrix, then 
##  solve(X) returns its inverse.

## Functions: 
##  makeCacheMatrix: This function creates a special "matrix" object that can 
##      cache its inverse.
##  cacheSolve: This function computes the inverse of the special "matrix" 
##      returned by makeCacheMatrix above. If the inverse has already been 
##      calculated (and the matrix has not changed), then the cachesolve should
##      retrieve the inverse from the cache.

## Use Conditions:
##  Assumes we are using `solve()` method which throws an error in the following
##  situations:
##      1: non-square matrix (i.e. not 2x2 or 10x10, etc.)
##      2: matrix is singular

## Tested Matrixes:
##  matrix(1:4,2,2)
##      Small enough matrix to test functionality works per example usage. 
##      No performance improvements given the size of the test subject.
##  matrix(rnorm(10000),100,100)
##      Show, using system.time() clear signs of improvement using cached 
##      object versus regenerating each time.

makeCacheMatrix <- function(x = matrix()) {
    ms <- NULL
    set <- function(y) {
        x <<- y
        ms <<- NULL
    }
    get <- function() x
    setSolve <- function(ms) ms <<- ms
    getSolve <- function() ms
    list(set = set, get = get,
         setSolve = setSolve,
         getSolve = getSolve)
}


## cacheSolve method is used to return a cached value for a given
## makeCacheMatrix or generate one if not-exists. 
## The generated cached inverted matrix is then also available through
## the makeCacheMatrix object.
cacheSolve <- function(x, ...) {    
    ## Return a matrix that is the inverse of 'x'
    ms <- x$getSolve()
    if(!is.null(ms)) {
        message("getting cached data")
        return(ms)
    }
    data <- x$get()
    ms <- solve(data, ...)
    x$setSolve(ms)
    ms    
}
