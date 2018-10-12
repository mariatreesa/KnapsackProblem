
#' Knapsack brute force algorithm
#' @author Brian Masinde, Maria Treesa Sebastian, Omkar
#'

# pseudo-random generated data set.

set.seed(1010)
n <- 20
knapsack_objects <- data.frame(
  w <- sample(1:4000, size = n, replace = TRUE),
  v <- runif(n = n, 0 ,10000)
)

colnames(knapsack_objects) <- c("w","v")

bag <- data.frame(
  w <- c(10,5,8,12,15),
  v <- c(4,5,8,3,1)
)

colnames(bag) <- c("v","w")

# function takes dataframe X and limit W
knapsack_brute_force <- function(X,W){
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
    for (j in 1:k) {
      # if sum of comb value is less than W store it in sel
      if(sum(bag[combs[[i]][,j],2]) < W) {

        # max value from comb
        value_knap$value <- max(sum(bag[combs[[i]][,j],2]))

        # elements with maximum value and least weight
        value_knap$elements <- combs[[i]][,j]
      }
    }


  }

return(value_knap)

}

knapsack_brute_force(knapsack_objects, W = 4500)



