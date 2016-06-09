# library(fbseq)

# Generate a small version of the Paschold et al. (2012) data.
# Use only the two parental varieties and test for differential expression.
paschold_DE = function(genes = globals("genes")){
  data(paschold)
  contrasts = list(
    high = c(beta_1 = 0, beta_2 = 1),
    low = c(beta_1 = 0, beta_2 = -1))
  q = qnorm(0.9, 0, sqrt(0.05))
  bounds = c(high = q, low = q)
  propositions = list(high = 1, low = 2)
  counts = paschold@counts
  g = sort(sample.int(dim(counts)[1], min(dim(counts)[1], genes), replace = F))
  counts = counts[g, grep("^(B73|Mo17)_", colnames(counts))]
  design = paschold@design[grep("^(B73|Mo17)_", rownames(paschold@design)), 1:2]
  design[,2] = rep(c(-1, 1), each = nrow(design)/2)
  Scenario(counts = counts, design = design, contrasts = contrasts, 
    bounds = bounds, propositions = propositions)
}
