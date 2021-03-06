## The code below contains a pair of functions that cache 
## the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i
  list(set=set, get=get, 
       setInverse = SetInverse,
       getInverse = getInverse)
  
}

## This function computes the inverse of the special "matrix" returned by
## the function above
cacheInverse <- function(x, ...) {
  i <- x$getInverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- mean(data, ...)
  x$setInverse(i)
  i
}



