# RocketChat demo
Automatic deployment of RocketChat 7.10 demo instance to Azure.

## Setting up the deployment environment
1. **Install Ansible with AzureRM and Azure CLI**
- *(Installing Ansible via Python Virtual Environment)*
```
pyenv local 3.12.12 # Pyenv example
pyenv exec python -m venv .venv

python -m venv .venv # System python

source .venv/bin/activate

python -m pip install ansible
ansible-galaxy collection install azure.azcollection --force
python -m pip install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements.txt
```

Do **not** install Azure CLI into the same virtual environment, AzureRM has conflicting packages.

2. **Authenticate to Azure**
```
az login # For Local Deployments
```

## Provision Infrastructure
1. **Provision Resources**
```
ansible-playbook provision.yaml -v
```
