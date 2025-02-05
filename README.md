# CD-demo-tf-branching-1

Demo repo for terraform branching

## Pipeline Flow

```mermaid

flowchart LR

push([Push to Main]) --> terraform-plan
push -- on push to main --> terraform-apply

pr([Pull Request to Main]) --> terraform-plan
push -- on pr to main --> terraform-apply

subgraph terraform-plan [Terraform Plan]
  direction LR
  tp1(Checkout to runner) -->
  tp2(Setup tf) -->
  tp3(tf format) -->
  tp4(tf init) -->
  tp5(tf validate) -->
  tp6(tf plan) -->
  tp7(Store Plan File) -->
  tp8(Publish tf Plan to Task Summary) -- if pr -->
  tp9(Publish tf plan to PR)
end

subgraph terraform-apply [Terraform Apply]
  direction LR
  ta1(Checkout to runner) -->
  ta2(Setup tf) -->
  ta3(tf init) -->
  ta4(Download plan file) -->
  ta5(tf apply) -->
  ta6(Publish tf Plan to Task Summary) -- if pr -->
  ta7(Publish tf plan to PR)
end

```

### Notes

1. Plan stage uses write credentials currently. Use separate credentials for plan and apply stages.
2. Each env uses same credentials, use separate for each env in future
