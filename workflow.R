library(workflowHelper)

sources = c("config.R", paste0("R/", list.files("R")))
packages = strings(fbseq, plyr)

datasets = commands(
  pascholdDE = paschold_DE(),
  poissonDE = poisson_DE()
)

analyses = commands(
  fb = fb(..DATASET..),
  fbh = fbh(..DATASET..),
  fbhh = fbhh(..DATASET..)
)

summaries = commands(
  psrf = gelman(..ANALYSIS..)
)

plan_workflow(sources = sources, packages = packages, datasets = datasets,
  analyses = analyses, summaries = summaries,
  clean = "rm -rf err.txt Makefile out.txt README.html remake.yml")
