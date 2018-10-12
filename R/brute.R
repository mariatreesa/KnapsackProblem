
#' Knapsack brute force algorithm
#' @author Brian Masinde, Maria Treesa Sebastian, Omkar
#'

# pseudo-random generated data set.

#set.seed(1010)
#n <- 20
#knapsack_objects <- data.frame(
#  w <- sample(1:4000, size = n, replace = TRUE),
#  v <- runif(n = n, 0 ,10000)
#)

#colnames(knapsack_objects) <- c("w","v")

bag <- data.frame(
  v <- c(3,2,5,6,7),
  w <- c(10,5,8,12,15)
)

colnames(bag) <- c("v","w")


sel1 <- bag[combs[,1],]

# power set
#pset <- c()
#for(i in 1:2^n){
#  pset <- c(intToBits(i)[i:32], pset)
#  pset[i] == 1
#}

#trial <- combn(n)



#x <- matrix(intToBits(1:(2^n-1)), ncol=2^n-1);

# the "on-off" combinations for each position
#combs = sapply(knapsack_objects$v, function(x) as.integer(intToBits(x)[seq_len(knapsack_objects$v)]))

# function takes dataframe X and limit W
knapsack_brute_force <- function(X,W){
  # empty list
  value_knap <- list(value = 0, elements = c(0,0))

  #number of items
  n <- nrow(X)

  # number of columns
  cols<- ncol(X)
  # list of all possible combinations
  combs <- list()
  # get all possible combinations
  # We want as many items as possible in the bag
  for(i in seq_len(n)){

  combs[i] <- list(combn(n, i))

  }

  value_knap$value <- bag[combs[[1]][1],1]
  # filter by rows of the data by comb
  sel <- list(val = 0, weight = 0)

  # get total weight and value of selected items
  sel$val <- sum(bag[combs[[2]][,2], 1])
  sel$weight <- sum(bag[combs[[2]][,2], 2])

  for(i in seq_len(n)){
    k = ncol(combs[[i]])
    # for each selection get the total value
    for (j in seq_len(k)) {
      value_knap$value <- max(sum(bag[combs[[i]][,k],1]))

      max_val <- value_knap$value
       value_knap$elements <- which(sum(bag[combs[[i]][,k],1])) == max_val
    }

   # get elements with max val


  }
return(value_knap)

}

knapsack_brute_force(bag, 35)

my_list <- list(a = bag, b = bag)

