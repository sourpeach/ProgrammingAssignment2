## The fucntions will attempt to cache a matrix and inverse the matrix

## makeCacheMatrix will set the matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y   
    i <<- NULL ## Invertable
  }
  get <- function() x
  setinv <- function(inv) i <<- inv
  getinv <- function() i
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}


## This fucntion will inverse the matrix cached by the above fucntion

cacheSolve <- function(x, ...) {
  i <- x$getinv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data,...)
  x$setinv(i)
  i
        ## Return a matrix that is the inverse of 'x'
}
