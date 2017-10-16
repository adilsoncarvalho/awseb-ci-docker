#!/bin/sh

# create the aws credentials file

if [ -z $AWS_ACCESS_KEY_ID ]; then
  echo 'You must set your $AWS_ACCESS_KEY_ID env var'
  exit 1
fi

if [ -z $AWS_SECRET_ACCESS_KEY ]; then
  echo 'You must set your $AWS_SECRET_ACCESS_KEY env var'
  exit 2
fi

if [ ! -f pipeline/config.yml ]; then
  echo 'You must have an aws eb configuration at pipeline/config.yml'
  exit 3
fi

mkdir -p ~/.aws
echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id = $AWS_ACCESS_KEY_ID" >> ~/.aws/credentials
echo "aws_secret_access_key = $AWS_SECRET_ACCESS_KEY" >> ~/.aws/credentials

# copy configuration file

mkdir -p .elasticbeanstalk
cat pipeline/config.yml > .elasticbeanstalk/config.yml

~/.local/bin/eb $@
