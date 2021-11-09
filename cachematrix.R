## Put comments here that give an overall description of what your
## functions do

## Cache creation, basically a rewrite of the assignment example

makeCacheMatrix <- function(x = matrix()) {
  cache<-NULL
  get<-function() x
  set<-function(y){
    x <<- y
    cache <<- NULL
  }
  setinvert <- function(inv){
    cache <<-inv
  }
  getinvert <-function(){
    # IRL I'd calculate invert and check/write a cache here for encapsulation
    # reasons, but the exercise explicitly says to do this
    # in separate cacheSolve function
    cache
  }
  list(set=set, get=get, setinvert=setinvert, getinvert=getinvert)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  if (!is.null(x$getinvert())){
    message('Retrieving from cache')
    return (x$getinvert())
  }
  else{
    inv<-solve(x$get(), ...)
    x$setinvert(inv)
    return(inv)
  }
}
