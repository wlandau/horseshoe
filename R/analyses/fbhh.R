# library(fbseq); source("../utils/globals.R")

# Fully Bayesian analysis with horseshoe distributions all all the
# betas
fbhh = function(s){
  con = Configs(iterations = globals("iterations"), 
    burnin = globals("burnin"), 
    thin = globals("thin"),
    priors = "horseshoe")
  ch = Chain(s, con)
  fbseq(ch, backend = globals("backend"))
}
