## The functions here are to take the benifit of caching in Matrix Inversion

## This unction is used to create a special matrix object to cache the inverse

makeCacheMatrix <- function(x = matrix()) {
  invsample <- NULL
  set <- function(x) {
    Sample <<- x
    invsample <<- NULL
  }

  get <- function() sample
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() invsample
  list(set = set,get = get,setInverse = setInverse,getInverse = getInverse)

}


## This function is used to calculate the inverse of the special matrix
##If the inverse is already computed it will be retrieved from the cache

cacheSolve <- function(sample, ...) {
## Return a matrix that is the inverse of 'sample'
  inv <- sample$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(invsample)
  }

  mat <- sample$get()
  invsample <- solve(mat, ...)
  sample$setInverse(invsample)
  invsample

        }
