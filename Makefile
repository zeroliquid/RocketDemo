#!make
include .env
export

IMAGE ?= ansible-execution-env

PENVS = --penv AZURE_SUBSCRIPTION_ID \
        --penv AZURE_CLIENT_ID \
        --penv AZURE_SECRET \
        --penv AZURE_TENANT

build:
	ansible-builder build --container-runtime docker -t $(IMAGE):latest

provision:
	envsubst < ./group_vars/all.yaml.tmpl > ./group_vars/all.yaml
	ansible-navigator run provision.yaml --pp never --execution-environment-image $(IMAGE) $(PENVS)

deploy:
	envsubst < ./group_vars/all.yaml.tmpl > ./group_vars/all.yaml
	ansible-navigator run deploy.yaml --pp never --execution-environment-image $(IMAGE) $(PENVS)

cleanup:
	envsubst < ./group_vars/all.yaml.tmpl > ./group_vars/all.yaml
	ansible-navigator run cleanup.yaml --pp never --execution-environment-image $(IMAGE) $(PENVS)