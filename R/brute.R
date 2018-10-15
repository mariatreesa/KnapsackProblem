
#' Knapsack - brute force algorithm
#' @author Brian Masinde, Maria Treesa Sebastian, Omkar
#'
#' @param x as data frame
#'
#' @param W as numeric
#'
#' @export brute_force_knapsack
#'
#' @return value_knap
#'
#' @examples set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w=sample(1:4000, size = n, replace = TRUE), v=runif(n = n, 0, 10000))
#' brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
#'




# function takes dataframe X and limit W
brute_force_knapsack <- function(x,W){
  # stop for erroneous input
  if(is.numeric(W)== F || is.data.frame(x) ==F){
    stop("Please enter valid inputs")
  }
  else if(W <= 0){
    stop("Please enter weight larger than 0")
  }


  # empty list
  value_knap <- list(value = c(0), elements = c())

  #number of items
  n <- nrow(x)

  # list of all possible combinations
  combs <- list()
  # get all possible combinations
  # We want as many items as possible in the bag
  for(i in seq_len(n)){

  combs[i] <- list(combn(n, i))

  }

  for(i in seq_len(n)){
    k = ncol(combs[[i]])

    # for each selection get the total value
    for (j in seq_len(k)) {
      # if sum of comb value is less than W store it in sel
      if((sum(x[combs[[i]][,j],1]) <= W) && sum(x[combs[[i]][,j],2]) > value_knap$value) {

        # max value from comb
        value_knap$value <- sum(x[combs[[i]][,j],2])


        # elements with maximum value and least weight
        value_knap$elements <- combs[[i]][,j]
      }
    }


  }

return(value_knap)

}



