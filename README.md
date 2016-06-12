This repo is for debugging the [`fbseq`](https://github.com/wlandau/fbseq) package when the horseshoe distribution is used in the model. 

# Run the workflow

This repo uses the [`workflowHelper`](https://github.com/wlandau/workflowHelper) package, so the steps to run are as follows.

1. Run the script `workflow.R` to create a [`Makefile`](https://www.gnu.org/software/make/).
2. Optionally, configure simulation parameters with the small functions in `config.R`.
3. Run `make`. If you're on a cluster, you can do this through `job.sh`.
