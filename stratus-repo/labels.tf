# This file should codify what's currently in the labeller config
# see https://github.com/pfizer/stratus-template-worker-python/blob/mainline/.github/labels.yml
# and https://github.com/pfizer/stratus-template-worker-python/blob/mainline/.github/workflows/labels.yml
#
# @todo: Fill in the rest of the labels.
resource "github_issue_label" "bug" {
  color = "d73a4a"
  name = "bug"
  description = "Something isn't working"
  repository = github_repository.this.id
}