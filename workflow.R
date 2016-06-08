library(workflowHelper)

sources = "R/datasets"
packages = "fbseq"

datasets = commands(
  paschold_DE_1000 = paschold_DE(genes = 1e3),
  poisson_DE_1000 = poisson_DE(genes = 1e3)
)

plan_workflow(sources = sources, packages = packages, datasets = datasets)
