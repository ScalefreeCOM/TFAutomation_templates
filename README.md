# TFAutomation_templates

Find the detailed documentation for reusable workflows [here](https://wiki.scalefree.net/it/devops/reusable-workflows).

### Usage

Create a file in the path .github/workflows, example down below.

```yaml

name: 'Build'

on:
  workflow_dispatch:
  pull_request:
    types: [opened, synchronize]
    branches:
      - main
      
jobs:
  call-workflow:
    strategy:
      matrix:
        target: [./, ./common, ./network]
    uses: ScalefreeCOM/TFAutomation_templates/.github/workflows/terraform-build.yml@main
    with:
      region: eu-west-3
      tf_version: "1.5.4"
      working_directory: ${{ matrix.target }}
    secrets: inherit
    permissions:
      contents: read

```

> [!NOTE]
> **on**: when workflow is triggered </br>
> **uses**: path to reusable workflow </br>
> **with**: inputs for reusable workflow

If you have multiple directories use the matrix strategy:

```yaml
    strategy:
      matrix:
        target: [./, ./common, ./network]
```

replace your directories with those in the example.

### Inputs for different templates:

<details>
  <summary>terraform-build.yml</summary>

  [Example](https://github.com/ScalefreeCOM/TFAutomation_templates/blob/main/examples/terraform-build.yml)
  
  | input name | default       | required | 
  |------------|---------------|----------|
  | runs-on    | ubuntu-latest | no       |  
  | region     | eu-west-1     | no       |  
  | tf_version   | -             | yes      |  
  | working_directory  | -        | yes       |

  | secrets | requires |
  |---------|----------|
  | TFAUTOMATION_AWS_ACCESS_KEY	| yes |
  | TFAUTOMATION_AWS_SECRET_ACCESS_KEY | yes |
  
</details>

<details>
  <summary>terraform-deploy.yml</summary>

  [Example](https://github.com/ScalefreeCOM/TFAutomation_templates/blob/main/examples/terraform-deploy.yml)

  | input name | default       | required | 
  |------------|---------------|----------|
  | runs-on    | ubuntu-latest | no       |  
  | region     | eu-west-1     | no       |  
  | tf_version   | -             | yes      |  
  | working_directory  | -        | yes       |
  | approvers     | -     | yes       | 
  | minimum-approvals     | 2     | no       | 
  | issue-title     | Deploying     | no       | 
  | issue-body     | Please approve or deny the deployment     | no       |  
  
  | secrets | requires |
  |---------|----------|
  | TFAUTOMATION_AWS_ACCESS_KEY	| yes |
  | TFAUTOMATION_AWS_SECRET_ACCESS_KEY | yes |
  
</details>

<details>
  <summary>docker-image-build-push.yml</summary>

  [Example](https://github.com/ScalefreeCOM/TFAutomation_templates/blob/main/examples/build-push-image.yml)

  | input name | default       | required | 
  |------------|---------------|----------|
  | runs-on    | ubuntu-latest | no       |  
  | region     | eu-west-1     | no       |  
  | ecr-repo   | -             | yes      |  
  | image_tag  | latest        | no       |
  
  | secrets | requires |
  |---------|----------|
  | TFAUTOMATION_AWS_ACCESS_KEY	| yes |
  | TFAUTOMATION_AWS_SECRET_ACCESS_KEY | yes |
  
</details>
