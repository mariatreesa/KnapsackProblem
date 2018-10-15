[![Build Status](https://travis-ci.org/mariatreesa/RLab6.svg?branch=master)](https://travis-ci.org/mariatreesa/RLab6)


<!-- README.md is generated from README.Rmd. Please edit that file -->
knapsack
========

The goal of knapsack is to find the combination of objects with maximum value without exceeding a given weight. Three approaches are implemented, the brute force algorithm, greedy algorithm and dynamic algorithm.

Installation
------------

You can install knapsack from github with:

``` r
#install.packages("devtools")
devtools::install_github("mariatreesa/RLab6")
```

Examples
--------

The knapsack objects used:

    #>      w        v
    #> 1 3660 4615.520
    #> 2 3749 4137.988
    #> 3 1145 8544.690
    #> 4 3322 1587.847
    #> 5 2567 5226.892
    #> 6 2077 4039.024

The following code shows how to invoke the three algorithms for knapsack problem.

### Brute Force Algorithm

    #> $value
    #> [1] 12634.27
    #> 
    #> $elements
    #> [1] 3 8

### Dynamic Algorithm

    #> $value
    #> [1] 12634
    #> 
    #> $elements
    #> [1] 3 8

### Greedy Algorithm

    #> $value
    #> [1] 12634
    #> 
    #> $elements
    #> [1] 8 3
