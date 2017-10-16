# awseb-ci-docker

Opinionated way to deploy apps to AWS Elastic Beanstalk.

## Requirements

Required environment variables:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

AWS EB Configuration file:

- `pipeline/config.yml`

## Usage

You can add it on your `bitbucket-pipelines.yml` in two ways:

```yml
image: adilsoncarvalho/awseb-ci

pipelines:
  branches:
    master:
    - step:
      script:
      - deploy.sh deploy production
```

Or, if your want, you can use it just on your publishing step:

```yml
pipelines:
  branches:
    master:
    - step:
      image: adilsoncarvalho/awseb-ci
      script:
      - deploy.sh deploy production
```
