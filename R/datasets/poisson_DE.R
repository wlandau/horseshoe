# library(fbseq); source("paschold_DE.R")

# Generate a small dataset using Poisson counts.
#' @param frac_DE Fraction of differentially expressed genes.
#' @param LFC Log fold change in expression levels of DE genes.
poisson_DE = function(genes = globals("genes"), frac_DE = 0.1, LFC = 1){
  s = paschold_DE(genes = genes)
  d = as.data.frame(matrix(5, nrow = genes, ncol = nrow(s@design)))
  colnames(d) = paste0("group", rep(1:2, each = nrow(s@design)/2))
  rownames(d) = paste0("gene", 1:genes)
  g = sample.int(genes, floor(genes*frac_DE))
  d$DE = F
  d$DE[g] = T
  m = t(apply(d, 1, function(x){
    n = length(x)-1
    h = n/2
    DE = x[n+1]
    r = x[names(x) != "DE"]
    if(DE){
      i = (-1)^(runif(1) < 0.5)
      x[1:h] = x[1:h] + i*LFC
      x[(h+1):n] = x[(h+1):n] - i*LFC
    }
    x[1:n]
  }))
  s@counts = m
  s
}
