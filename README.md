# RocketChat demo
Automatic deployment of RocketChat 7.10 demo instance to Azure.

## Setting up the deployment environment
1. **Install Ansible and Azure CLI**
- *(via Python Virtual Environment)*
```
pyenv local 3.13.8 # Pyenv example
pyenv exec python -m venv .venv

python -m venv .venv # System python

source .venv/bin/activate
python -m pip install -r requirements.txt

# python -m pip install ansible
# ansible-galaxy collection install azure.azcollection --force
# python -m pip install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements.txt
# python -m pip install azure-cli
```
2. **Authenticate to Azure**
```
az login # For Local Deployments
```
3. ****
