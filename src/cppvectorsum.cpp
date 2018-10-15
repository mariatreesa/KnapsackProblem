#include <Rcpp.h>
using namespace Rcpp;


//[[Rcpp::export]]
double  vectorSum(NumericVector x) {
  return std::accumulate(x.begin(), x.end(), 0.0);
}


