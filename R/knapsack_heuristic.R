#' knapsack - Greedy Algorithm
#'
#' @author Maria,Masinde,Omkar
#' @param x as dataframe
#' @param W as numeric
#' @param fast as logical
#'
#' @return list containing value and elements
#' @export greedy_knapsack
#'
#' @examples set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w=sample(1:4000, size = n, replace = TRUE), v=runif(n = n, 0, 10000))
#' greedy_knapsack(x = knapsack_objects[1:8,], W = 3500)
#'



greedy_knapsack <- function(x,W, fast = FALSE ){

  if(is.numeric(W)== F || is.data.frame(x) ==F){
    stop("Please enter valid inputs")
  }
  else if(W <= 0){
    stop("Please enter weight larger than 0")
  }


  x$elements <- as.numeric(rownames(x))
  x$vw <- x$v/x$w
  x <- x[order(-x$vw),]
  x <- x[which(x$w <= W),]
  x$weight_sum <- cumsum(x$w)
  x <- x[which(x$weight_sum <= W),]
  if(fast == TRUE){
    knapsackvalue <- vectorSum(x$v)
  }else{
  knapsackvalue <- sum(x$v)
  }
  elements <- x$elements

   result <- list("value" = round(knapsackvalue), "elements" = elements)
   return(result)

}

