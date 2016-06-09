library(workflowHelper)

sources = c("config.R", paste0("R/", list.files("R")))
packages = strings(fbseq, plyr)

datasets = commands(
  pascholdDE = paschold_DE(), # Paschold (2012) parents and 1000 genes
  poissonDE = poisson_DE()    # Poisson counts in 2 groups with no overdispersion 
)

analyses = commands(
  fb = fb(..DATASET..),    # fully Bayes, normal betas
  fbh = fbh(..DATASET..),  # fully Bayes, horseshoe betas except beta_1
  fbhh = fbhh(..DATASET..) # fully Bayes, all horseshoe
)

summaries = commands(
  psrf = gelman(..ANALYSIS..)
)

plan_workflow(sources = sources, packages = packages, datasets = datasets,
  analyses = analyses, summaries = summaries,
  clean = "rm -rf err.txt Makefile out.txt README.html remake.yml")
