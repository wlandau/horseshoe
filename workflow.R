library(workflowHelper)

sources = c("config.R", paste0("R/", list.files("R")))
packages = strings(fbseq, plyr)

datasets = commands(
  pascholdDE = paschold_DE(),      # Paschold (2012) parents and 1000 genes
  poissonDE = poisson_DE(),        # Poisson counts in 2 groups with no overdispersion 
  pascholdFull = paschold_full()  # Full Paschold (2012) dataset
)

analyses = commands(
  fb = fb(..DATASET..),               # fully Bayes, normal betas
  fbh = fbh(..DATASET..),             # fully Bayes, horseshoe betas except beta_1
  fbhh = fbhh(..DATASET..),           # fully Bayes, all horseshoe
  fixtheta1 = fixtheta1(..DATASET..), # like fbh  except theta is not updated
  fixtheta2 = fixtheta1(..DATASET..)  # like fbhh except theta is not updated
)

summaries = commands(
  psrf = gelman(..ANALYSIS..)
)

plan_workflow(sources = sources, packages = packages, datasets = datasets,
  analyses = analyses, summaries = summaries,
  begin = "rm -f err.txt out.txt",
  clean = "rm -rf err.txt Makefile out.txt README.html remake.yml")
