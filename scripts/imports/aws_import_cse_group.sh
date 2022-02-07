#!/bin/bash

export CONFIG_DIR="/home/ec2-user/config/"

today=$(date --iso)

export SNYK_LOG_PATH="${CONFIG_DIR}cache/logs/${today}"

mkdir -p $SNYK_LOG_PATH

export SNYK_TOKEN=$SNYK_TOKEN_cse_group

/usr/local/bin/snyk-api-import import --file "${CONFIG_DIR}targets/customer-success-engineering.json"
