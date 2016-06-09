# library(fbseq); library(plyr); source("paschold_DE.R"); source("../utils/globals.R"); source("../../config.R")

# The full Paschold et al. (2012) data.
paschold_full = function(){
  data(paschold)
  if(scaling() == "down") paschold@counts = paschold@counts[1:globals("genes"),]
  paschold
}
