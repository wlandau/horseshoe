# library(fbseq); library(plyr); source("paschold_DE.R"); source("../utils/globals.R"); source("../../config.R")

# Generate a small dataset using Poisson counts overdispersed slightly.
#' @param frac_DE Fraction of differentially expressed genes.
#' @param LFC Log fold change in expression levels of DE genes.
poisson_DE = function(frac_DE = 0.1, LFC = 1){
  genes = globals("genes")
  s = paschold_DE()
  g = sort(sample.int(genes, floor(genes*frac_DE)))
  s@supplement$DE_genes = g
  LFC_mat = matrix(0, nrow = nrow(s@counts), ncol = ncol(s@counts))
  LFC_mat[g,] = aaply(LFC_mat[g,], 1, function(x){
    i = (-1)^(runif(1) < 0.5)
    LFC*c(rep(i, length(x)/2), rep(-i, length(x)/2))
  })
  m = LFC_mat + 5
  eps = matrix(rnorm(prod(dim(m)), 0, 0.1), nrow = nrow(m), ncol = ncol(m))
  d = matrix(rpois(prod(dim(m)), exp(m + eps)), ncol = ncol(m))
  colnames(d) = paste0("group", rep(1:2, each = nrow(s@design)/2))
  rownames(d) = paste0("gene", 1:genes)
  s@counts = d
  s
}
