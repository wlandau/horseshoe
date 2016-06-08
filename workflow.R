library(workflowHelper)

sources = "R/paschold.R"

datasets = commands(
  paschold_DE_1000 = paschold_DE(genes = 1e3)
)

plan_workflow(sources, datasets)
