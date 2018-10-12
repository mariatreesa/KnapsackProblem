
#' Knapsack brute force algorithm
#' @author Brian Masinde, Maria Treesa Sebastian, Omkar
#'
#' @param X
#'
#' @param W
#'
#' @export knapsack_brute_force
#'
#' @return value_knap
#'
#' @example knapsack_brute_force(X,W)



# function takes dataframe X and limit W
brute_force_knapsack <- function(X,W){
  # stop for erroneous input
  if(is.data.frame(X) == FALSE){
    stop("X is not a data frame")
  }

  # empty list
  value_knap <- list(value = c(), elements = c())

  #number of items
  n <- nrow(X)

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
      if(sum(X[combs[[i]][,j],1]) <= W) {

        # max value from comb
        value_knap$value <- max(sum(X[combs[[i]][,j],2]))

        # elements with maximum value and least weight
        value_knap$elements <- combs[[i]][,j]
      }
    }


  }

return(value_knap)

}

# Test case
set.seed(42)
n <- 2000
knapsack_objects <- data.frame(
  w=sample(1:4000, size = n, replace = TRUE),
  v=runif(n = n, 0, 10000)
)

brute_force_knapsack(knapsack_objects[1:8,], W = 3500)

