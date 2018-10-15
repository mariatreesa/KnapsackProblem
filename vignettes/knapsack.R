## ------------------------------------------------------------------------
library(knapsack)

## ----message=FALSE, warning=FALSE, include=FALSE, paged.print=FALSE------
set.seed(42)
n = 1000000
knapsack_objects <-
  data.frame(
    w=sample(1:4000, size = n, replace = TRUE),
    v=runif(n = n, 0, 10000)
  )

## ------------------------------------------------------------------------
head(knapsack_objects)

## ------------------------------------------------------------------------
brute_force_knapsack(x = knapsack_objects[1:8,],W=2000)


## ------------------------------------------------------------------------
dynamic_knapsack(x = knapsack_objects[1:8,],W=2000)


## ------------------------------------------------------------------------
greedy_knapsack(x = knapsack_objects[1:8,],W=2000)


## ------------------------------------------------------------------------
starttime <- Sys.time()
brute_force_knapsack(x = knapsack_objects[1:16,],W=2000)
endtime <- Sys.time()

bruteforce_time = endtime - starttime

## ----echo=FALSE----------------------------------------------------------
bruteforce_time

## ------------------------------------------------------------------------
starttime <- Sys.time()
dynamic_knapsack(x = knapsack_objects[1:500,],W=3500)
endtime <- Sys.time()

dynamic_time = endtime - starttime

## ----echo=FALSE----------------------------------------------------------
dynamic_time

## ------------------------------------------------------------------------
starttime <- Sys.time()
greedy_knapsack(x = knapsack_objects[1:1000000,],W=3500)
endtime <- Sys.time()

greedy_time = endtime - starttime

## ----echo=FALSE----------------------------------------------------------
greedy_time

## ------------------------------------------------------------------------
starttime <- Sys.time()
greedy_knapsack(x = knapsack_objects[1:1000000,],W=3500, fast = TRUE)
endtime <- Sys.time()

greedy_time = endtime - starttime

## ----echo=FALSE----------------------------------------------------------
greedy_time

