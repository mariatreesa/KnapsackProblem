#' knapsack - Greedy Algorithm
#'
#' @author Maria,Masinde,Omkar
#' @param x as dataframe
#' @param W as numeric
#'
#' @return list containing value and elements
#' @references
#' @export greedy_knapsack
#'
#' @examples set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w=sample(1:4000, size = n, replace = TRUE), v=runif(n = n, 0, 10000))
#' greedy_knapsack(x = knapsack_objects[1:8,], W = 3500)
#'
#'


greedy_knapsack <- function(x,W){

  if(is.numeric(W)== F || is.data.frame(x) ==F){
    stop("Please enter valid inputs")
  }
  else if(W <= 0){
    stop("Please enter weight larger than 0")
  }


   x$vw <- x$v/x$w
   x <- x[order(-x$vw),]

   # removing the elements with weight more than 0  to reduce the number of iteration
   x <- x[which(x$w <= W),]

   elements <- c()
   capacity <- W
   knapsackvalue <- 0


    for(i in 1:nrow(x)){
     currentweight <- x$w[i]
     currentvalue <- x$v[i]
     if((capacity - currentweight) >= 0){
      capacity = capacity - currentweight
       knapsackvalue = knapsackvalue + currentvalue
       elements = cbind(elements,as.numeric(rownames(x[i,])))
     }else{break();}


   }
   result <- list("value" = round(knapsackvalue), "elements" = as.vector(elements))
   return(result)

}

