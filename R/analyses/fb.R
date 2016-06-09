# library(fbseq); source("../utils/globals.R")

# Fully Bayesian analysis with normals on the betas
#' @param s fbseq::Scenario object output by dataset functions
fb = function(s){
  con = Configs(iterations = globals("iterations"), 
    burnin = globals("burnin"), 
    thin = globals("thin"))
  ch = Chain(s, con)
  fbseq(ch, backend = globals("backend"))
}
