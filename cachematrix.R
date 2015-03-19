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

makeCacheMatrix <- function(x = matrix()) {
#     m <- NULL
#     set <- function(y) {
#         x <<- y
#         m <<- NULL
#     }
#     get <- function() x
#     setmean <- function(mean) m <<- mean
#     getmean <- function() m
#     list(set = set, get = get,
#          setmean = setmean,
#          getmean = getmean)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
#     m <- x$getmean()
#     if(!is.null(m)) {
#         message("getting cached data")
#         return(m)
#     }
#     data <- x$get()
#     m <- mean(data, ...)
#     x$setmean(m)
#     m    
}
