# IaC with Pulumi

## Requirements

* Configure AWS cli user with permits
  * S3
  * Secret Manager
* Create a s3 bucket s3://your-bucket

## Installation
### Login to s3 bucket to save Pulumi state
``
pulumi login s3://your-bucket/pulumi-s3
``
### Create environment
``
pulumi stack init develop --cwd infra
``
### Copy config block from
* Pulumi.example.yaml
* to
* Pulumi.develop.yaml

### Preview list of resources to create
``
pulumi stack select develop --cwd infra
``
``
pulumi preview --cwd infra
``
### Create Resources
``
pulumi stack select develop --cwd infra
``

``
pulumi up --yes --cwd infra
``

### Delete Resources
``
pulumi destroy --cwd infra
``

