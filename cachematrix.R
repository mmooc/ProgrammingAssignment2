## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix generate 4 functions
## these 4 functions are:
## set = store the matrix
## get = return the matrix
## setinverse = store the inverse matrix
## getinverse = return the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  ## set = store the matrix
  set <- function(y){
    x<<- y
    m<<-NULL
  }
  ## return the matrix
  get <- function() x
  ## store the inverse matrix
  setinverse <- function(solve) m <<- solve
  ## return the inverse matrix
  getinverse <- function() m
  list(set = set, get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}


## Write a short comment describing this function

## cacheSolve use makeCacheMatrix function
## to store and return the inverse matrix, 
## or if it is already cached to retrieve it.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  ## check if it is already cached
  if(!is.null(m)){
    message("getting cached data")
  ## Return the cached matrix
    return(m)
  }
  ## get the matrix
  data <- x$get()
  ## find the inverse
  m <- solve(data, ...)
  ## storre
  x$setinverse(m)
  ## Return the inverse matrix
  m
}
