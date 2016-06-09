library(workflowHelper)

sources = paste0("R/", list.files("R"))
packages = strings(fbseq)

datasets = commands(
  pascholdDE = paschold_DE(),
  poissonDE = poisson_DE()
)

analyses = commands(
  fb = fb(..DATASET..),
  fbnh = fbnh(..DATASET..),
  fbhh = fbhh(..DATASET..)
)

plan_workflow(sources = sources, packages = packages, datasets = datasets,
  analyses = analyses, clean = "rm -rf Makefile README.html remake.yml")
