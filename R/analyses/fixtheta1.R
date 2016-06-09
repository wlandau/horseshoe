# library(fbseq); source("../utils/globals.R")

# Fully Bayesian analysis with horseshoe distributions all the
# betas except beta_1. Do not update theta in the MCMC.
#' @param s fbseq::Scenario object output by dataset functions
fixtheta1 = function(s){
  parms = setdiff(parameters(), "theta")
  con = Configs(iterations = globals("iterations"), 
    burnin = globals("burnin"), 
    thin = globals("thin"),
    priors = c("normal", rep("horseshoe", ncol(s@design)-1)),
    parameter_sets_return = parms,
    parameter_sets_update = parms)
  ch = Chain(s, con)
  fbseq(ch, backend = globals("backend"))
}
