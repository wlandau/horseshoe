# library(fbseq); source("../utils/globals.R")

# Fully Bayesian analysis with horseshoe distributions all all the
# betas except beta_1
fbnh = function(s){
  con = Configs(iterations = globals("iterations"), 
    burnin = globals("burnin"), 
    thin = globals("thin"),
    priors = c("normal", rep("horseshoe", ncol(s@design)-1)))
  ch = Chain(s, con)
  fbseq(ch, backend = globals("backend"))
}
