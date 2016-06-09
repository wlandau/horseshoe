# library(fbseq); source("../utils/globals.R")

# Fully Bayesian analysis with horseshoe distributions all the
# betas. Do not update theta in the MCMC.
#' @param s fbseq::Scenario object output by dataset functions
fixtheta2 = function(s){
  parms = setdiff(parameters(), "theta")
  con = Configs(iterations = globals("iterations"), 
    burnin = globals("burnin"), 
    thin = globals("thin"),
    priors = "horseshoe",
    parameter_sets_return = parms,
    parameter_sets_update = parms)
  ch = Chain(s, con)
  fbseq(ch, backend = globals("backend"))
}
