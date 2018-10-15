#include <Rcpp.h>
using namespace Rcpp;



// [[Rcpp::export]]
NumericMatrix knapSackdynamic_cpp(int W, NumericVector wt, NumericVector val, int n)
{
  int i,w;
  NumericMatrix K(n + 1, W + 1);
  for (i = 0; i <= n; i++)
  {
    for (w = 0; w <= W; w++)
    {
      if (i == 0 || w == 0){
        K(i,w) = 0;}
      else if (wt[i - 1] <= w){
        int temp =  wt[i-1];

        K(i,w) = std::max((val[i - 1] + K((i - 1),(w - temp))), K((i - 1),w));}
      else{
        K(i,w) = K((i - 1),w);}
    }
  }


  return K ;
}
