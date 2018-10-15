#' knapsack - Dynamic Algorithm
#'
#' @author Maria,Masinde,Omkar
#' @param x as dataframe
#' @param W as numeric
#' @param fast as TRUE/FALSE
#'
#' @return list containing value and elements
#' @export dynamic_knapsack
#'
#' @examples set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w=sample(1:4000, size = n, replace = TRUE), v=runif(n = n, 0, 10000))
#' dynamic_knapsack(x = knapsack_objects[1: 8,], W = 3500, fast=FALSE)
#'
#'




dynamic_knapsack <- function(x,W,fast = FALSE){

  if(is.numeric(W)== F || is.data.frame(x) ==F){
    stop("Please enter valid inputs")
  }
  else if(W <= 0){
    stop("Please enter weight larger than 0")
  }

  if(fast == FALSE){
   m <- matrix(0, ncol = (W+1), nrow = (nrow(x)+1))

   # The code below runs two for loops to get the maximum value
   #that can be extracted keeping the weight minimum

   for(i in 2:nrow(m)){
     for(j in 2:ncol(m)){
       if (x$w[i-1] > j-1){
        m[i, j] = m[i-1, j]}
       else if(j-x$w[i-1] >= 0){
          m[i, j] = max(m[i-1, j], m[i-1, ((j-x$w[i-1]))] + x$v[i-1])
        }
       else{
          m[i, j] = m[i-1, j]
        }

       }
   }
  }
  else{
    m = knapSackdynamic_cpp(W,x$w,x$v,nrow(x))
  }


   # the code below runs one for loop to get the elements that are used to get the value above
   val <- m[nrow(m),ncol(m)]
   elements <- c()

   for(row in nrow(m):2){
    if(!(val %in% m[row-1,])){
      elements <- c(elements, row-1)
      val = val - x$v[row-1]
    }

   }
   elements = sort(elements, decreasing = FALSE)

   result <- list("value" = round(m[nrow(m),ncol(m)]), "elements" = elements)
   return(result)

   }





