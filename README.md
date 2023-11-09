# TFAutomation_templates

https://wiki.scalefree.net/it/devops/reusable-workflows

docker-image-build-push.yml inputs:

| input name | default       | required | 
|------------|---------------|----------|
| runs-on    | ubuntu-latest | no       |  
| region     | eu-west-1     | no       |  
| ecr-repo   | -             | yes      |  
| image-tag  | latest        | no       |

| secrets | requires |
|---------|----------|
| TFAUTOMATION_AWS_ACCESS_KEY	| yes |
| TFAUTOMATION_AWS_SECRET_ACCESS_KEY | yes |
